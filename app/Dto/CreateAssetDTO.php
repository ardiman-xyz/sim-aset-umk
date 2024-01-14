<?php

namespace App\Dto;

use Illuminate\Http\UploadedFile;

class CreateAssetDTO
{
    public $images;
    public string $acquisitionMethodId;
    public string $conditionId;
    public string $categoryId;
    public string $name;
    public string $dateOfPurchase;
    public string $purchase_price;
    public string $quantity;
//    public string $purchaseReceipt;
    public string $description;
}
