<?php

namespace App\Dto\User;

class UpdateUserDto
{
    public string $name;
    public string $email;
    public string $role;
    public ?string $password = null;
}
