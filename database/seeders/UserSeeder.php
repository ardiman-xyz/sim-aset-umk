<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Role::create([
            "name" => "Admin",
            "guard_name" => "web"
        ]);

        $user = User::create([
            "name" => "Admin",
            "email" => "admin.aset@umkendari.ac.id",
            "password"  => "admin123"
        ]);

        $user->assignRole('Admin');
    }
}
