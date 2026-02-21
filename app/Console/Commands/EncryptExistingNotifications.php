<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

class EncryptExistingNotifications extends Command
{
    protected $signature = 'notifications:encrypt-existing {--dry-run} {--chunk=200}';
    protected $description = 'Encrypt existing notification fields in the obfuscated notifications table';

    public function handle(): int
    {
        $table = 'pqr_8x3m';

        if (!Schema::hasTable($table)) {
            $this->error("Table {$table} not found. Run the obfuscation migrations first.");
            return self::FAILURE;
        }

        $dryRun = (bool) $this->option('dry-run');
        $chunkSize = max(1, (int) $this->option('chunk'));
        $updatedRows = 0;
        $scannedRows = 0;

        DB::table($table)
            ->orderBy('k5_id')
            ->chunkById($chunkSize, function ($rows) use ($table, $dryRun, &$updatedRows, &$scannedRows) {
                foreach ($rows as $row) {
                    $scannedRows++;
                    $updates = [];

                    if ($this->shouldEncrypt($row->uio_tt ?? null)) {
                        $updates['uio_tt'] = Crypt::encryptString((string) $row->uio_tt);
                    }

                    if ($this->shouldEncrypt($row->asd_msg ?? null)) {
                        $updates['asd_msg'] = Crypt::encryptString((string) $row->asd_msg);
                    }

                    if ($this->shouldEncrypt($row->hjk_ue ?? null)) {
                        $updates['hjk_ue'] = Crypt::encryptString((string) $row->hjk_ue);
                    }

                    if ($this->shouldEncrypt($row->lop_md ?? null)) {
                        $metadataValue = $row->lop_md;
                        if (!is_string($metadataValue)) {
                            $metadataValue = json_encode($metadataValue);
                        }
                        $updates['lop_md'] = Crypt::encryptString((string) $metadataValue);
                    }

                    if ($this->shouldEncrypt($row->fgh_ic ?? null)) {
                        $updates['fgh_ic'] = Crypt::encryptString((string) $row->fgh_ic);
                    }

                    if ($this->shouldEncrypt($row->jkl_cl ?? null)) {
                        $updates['jkl_cl'] = Crypt::encryptString((string) $row->jkl_cl);
                    }

                    if ($this->shouldEncrypt($row->zxc_at ?? null)) {
                        $updates['zxc_at'] = Crypt::encryptString((string) $row->zxc_at);
                    }

                    if ($this->shouldEncrypt($row->vbn_aid ?? null)) {
                        $updates['vbn_aid'] = Crypt::encryptString((string) $row->vbn_aid);
                    }

                    if ($this->shouldEncrypt($row->nmq_am ?? null)) {
                        $updates['nmq_am'] = Crypt::encryptString((string) $row->nmq_am);
                    }

                    if ($this->shouldEncrypt($row->wer_uid ?? null)) {
                        $updates['wer_uid'] = Crypt::encryptString((string) $row->wer_uid);
                    }

                    if ($this->shouldEncrypt($row->plm_ut ?? null)) {
                        $updates['plm_ut'] = Crypt::encryptString((string) $row->plm_ut);
                    }

                    if ($this->shouldEncrypt($row->sdf_un ?? null)) {
                        $updates['sdf_un'] = Crypt::encryptString((string) $row->sdf_un);
                    }

                    if (!empty($updates)) {
                        $updates['bnm_ua'] = now();
                        $updatedRows++;

                        if (!$dryRun) {
                            DB::table($table)
                                ->where('k5_id', $row->k5_id)
                                ->update($updates);
                        }
                    }
                }
            }, 'k5_id');

        $mode = $dryRun ? 'Dry run' : 'Completed';
        $this->info("{$mode}. Scanned: {$scannedRows}, Updated: {$updatedRows}.");

        return self::SUCCESS;
    }

    private function shouldEncrypt($value): bool
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
