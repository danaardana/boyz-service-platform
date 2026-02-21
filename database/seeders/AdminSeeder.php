<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class AdminSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Use obfuscated table and column names
        DB::table('xxy_k7m2p')->updateOrInsert(
            ['rty_em' => \Illuminate\Support\Facades\Crypt::encrypt('admin@test.com')], // email
            [
                'qwe_nm' => \Illuminate\Support\Facades\Crypt::encrypt('Test Admin'), // name
                'rty_em' => \Illuminate\Support\Facades\Crypt::encrypt('test@newdomain.com'), // email
                'jkl_pw' => Hash::make('password'), // password
                'asd_ac' => true, // is_active
                'fgh_vf' => true, // verified
                'wer_ca' => now(), // created_at
                'sdf_ua' => now(), // updated_at
            ]
        );

        echo "Admin user created successfully!\n";
        echo "Email: test@newdomain.com\n";
        echo "Password: password\n";
    }
}
