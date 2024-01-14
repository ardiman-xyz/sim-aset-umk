<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CreateAssetRequest extends FormRequest
{

    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            "name" => "required|string",
            "categories" => "required|string",
            "acquisition_methods" => "required|string",
            "condition" => "required|string",
            "date_of_purchase" => "required|string",
            "purchase_price" => "required|string",
            "description" => "required|string",
        ];
    }
}
