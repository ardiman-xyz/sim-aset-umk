<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreUserRequest extends FormRequest
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
            'password' => 'required|string|min:8',
            'confirm_password' => 'required|string|same:password',
        ];
    }

    public function messages(): array
    {
        return [
            'name.required' => 'Input harus di isi!',
            'name.min' => 'Input harus di isi!',
            'email.required' => 'Input harus di isi!',
            'email.email' => 'Email tidak valid!',
            'email.min' => 'Input harus di isi!',
            'password.required' => 'Kata sandi baru harus diisi',
            'password.min' => 'Kata sandi baru harus memiliki minimal 8 karakter',
            'confirm_password.required' => 'Konfirmasi kata sandi harus diisi',
            'confirm_password.same' => 'Konfirmasi kata sandi tidak cocok dengan kata sandi baru',
        ];
    }
}
