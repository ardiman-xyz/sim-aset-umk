<?php

namespace App\Services;

use App\Dto\User\CreateUserDto;
use App\Models\User;
use Exception;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class UserService
{
    public function __construct(
        protected User $userModel
    ){}

    public function create(CreateUserDto $data)
    {

        $isEmailAlreadyExist = $this->findByEmail($data->email);
        if ($isEmailAlreadyExist) throw new Exception('Email already exist');

        DB::beginTransaction();
        try {
            $user = $this->userModel->create([
                "name" => $data->name,
                "email" => $data->email,
                "password" => Hash::make($data->password),
            ]);

            $user->assignRole($data->role);
            DB::commit();
            return $user;
        }catch (Exception $exception){
            DB::rollBack();
            throw new $exception;
        }

    }

    public function findByEmail(string $email)
    {
        return $this->userModel->where('email', $email)->first();
    }
}
