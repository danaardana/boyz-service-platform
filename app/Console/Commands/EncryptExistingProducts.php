<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class EncryptExistingProducts extends Command
{
    protected $signature = 'products:encrypt-existing {--dry-run} {--chunk=200}';
    protected $description = 'Encrypt existing product, option, and option value fields in obfuscated tables';

    public function handle(): int
    {
        $dryRun = (bool) $this->option('dry-run');
        $chunkSize = max(1, (int) $this->option('chunk'));

        $tables = [
            [
                'table' => 'prd_4x7m',
                'id' => 'k7_id',
                'fields' => ['qwe_nm', 'rty_ct', 'uio_im', 'asd_ds'],
            ],
            [
                'table' => 'opt_6k2p',
                'id' => 'k8_id',
                'fields' => ['rty_dn'],
            ],
            [
                'table' => 'val_9m3q',
                'id' => 'k9_id',
                'fields' => ['qwe_vl', 'rty_dv'],
            ],
        ];

        foreach ($tables as $tableConfig) {
            if (!Schema::hasTable($tableConfig['table'])) {
                $this->warn("Table {$tableConfig['table']} not found. Skipping.");
                continue;
            }

            $this->encryptTable($tableConfig, $chunkSize, $dryRun);
        }

        return self::SUCCESS;
    }

    protected function encryptTable(array $config, int $chunkSize, bool $dryRun): void
    {
        $table = $config['table'];
        $idColumn = $config['id'];
        $fields = $config['fields'];

        $updated = 0;
        $scanned = 0;

        DB::table($table)
            ->orderBy($idColumn)
            ->chunkById($chunkSize, function ($rows) use ($table, $idColumn, $fields, $dryRun, &$updated, &$scanned) {
                foreach ($rows as $row) {
                    $scanned++;
                    $updates = [];

                    foreach ($fields as $field) {
                        $value = $row->{$field} ?? null;
                        if ($this->shouldEncrypt($value)) {
                            $updates[$field] = Crypt::encryptString((string) $value);
                        }
                    }

                    if (!empty($updates)) {
                        $updated++;
                        if (!$dryRun) {
                            DB::table($table)->where($idColumn, $row->{$idColumn})->update($updates);
                        }
                    }
                }
            }, $idColumn);

        $mode = $dryRun ? 'Dry run' : 'Completed';
        $this->info("{$mode} {$table}. Scanned: {$scanned}, Updated: {$updated}.");
    }

    protected function shouldEncrypt($value): bool
    {
        if (!is_string($value) || $value === '') {
            return false;
        }

        try {
            Crypt::decryptString($value);
            return false;
        } catch (\Throwable $e) {
            return true;
        }
    }
}
