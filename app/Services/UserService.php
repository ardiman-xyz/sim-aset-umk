<?php

namespace App\Services;

use App\Dto\User\CreateUserDto;
use App\Dto\User\UpdateUserDto;
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

    public function getAll()
    {
        return $this->userModel->with('roles')->latest()->get();
    }

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

    public function findById(int $id)
    {
        return $this->userModel->find($id);
    }

    public function isDuplicateEmail(string $email, int $userId)
    {
        return $this->userModel->where('email', $email)
            ->where('id', '!=', $userId)
            ->exists();
    }

    public function update(UpdateUserDto $data, string $id) 
    {
        $user = $this->findById((int) $id);
        if(!$user) throw new Exception("User tidak ditemukan!");

        $isDuplicateEmail = $this->isDuplicateEmail($data->email, $id);
        if($isDuplicateEmail)  throw new Exception("Email used another user");

        $user->name      = $data->name;
        $user->email     = $data->email;
        $user->password  = $data->password ? Hash::make($data->password) : $user->password;
        $user->save();

        return $user;
    }
}
