<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Technician;

class TechnicianSeeder extends Seeder
{
    public function run(): void
    {
        Technician::create([
            [
                't2_nm' => 'Andi Pratama',
                't3_em' => 'andi.technician@example.com',
                't4_ph' => '081234567890',
                't5_rl' => 'technician',
                't6_st' => 'active',
                't7_nt' => 'Senior installation technician',
                'ujm_ca' => now(),
                'bnm_ua' => now(),
            ],
            [
                't2_nm' => 'Budi Santoso',
                't3_em' => 'budi.technician@example.com',
                't4_ph' => '089876543210',
                't5_rl' => 'technician',
                't6_st' => 'active',
                't7_nt' => 'Field technician',
                'ujm_ca' => now(),
                'bnm_ua' => now(),
            ],
        ]);
    }
}
