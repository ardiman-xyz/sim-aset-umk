<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    
    public function rules(): array
    {
        return [
            'name' => 'required|string|min:2',
            'email' => 'required|string|email|min:2',
            "password"  => ["nullable", "string", "max:255", "min:5"]
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Input harus di isi!',
            'name.min' => 'Input harus di isi!',
            'email.required' => 'Input harus di isi!',
            'email.email' => 'Email tidak valid!',
            'password.min' => 'Kata sandi baru harus memiliki minimal 8 karakter',
        ];
    }
}
