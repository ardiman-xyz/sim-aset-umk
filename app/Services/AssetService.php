<?php

namespace App\Services;

use App\Dto\CreateAssetDTO;
use App\Models\Asset;
use App\Models\Building;
use App\Models\Floor;
use App\Models\Gallery;
use Exception;
use Illuminate\Support\Facades\DB;

class AssetService
{
    /**
     * @throws Exception
     */
    public function create(CreateAssetDTO $data)
    {
        DB::beginTransaction();

        try {

            $quantity = (int)$data->quantity;
            $purchase_price = (int)$data->purchase_price;

           $asset = Asset::create([
                "acquisition_method_id" => $data->acquisitionMethodId,
                "condition_id" => $data->conditionId,
                "name" => $data->name,
                "date_of_purchase" => $data->dateOfPurchase,
                "purchase_price" => $purchase_price,
                "purchase_receipt" => null,
                "description" => $data->description,
               "quantity" => $quantity,
               "total_price" => ($quantity * $purchase_price)
            ]);

           $asset->categories()->attach([$data->categoryId]);
            foreach ($data->images as $image) {
                $path = $image->store('images', 'public');

                Gallery::create([
                    "asset_id" => $asset->id,
                    "file" => $path
                ]);
            }

            DB::commit();

            return $asset;

        }catch (Exception $exception)
        {
            DB::rollBack();

            throw new $exception;
        }
    }

    public function getFloors(string $buildingId)
    {
        $building = Building::find($buildingId);

        if(!$building) throw new Exception("Data gedung tidak ditemukan");

        return $building->floors()->select('id', 'name')
                ->get()  
                ->map(function ($floor) {
                    return [
                        'value' => $floor->id,
                        'label' => $floor->name
                    ];
                });

    }

    public function getRooms(string $floorId)
    {
        $building = Floor::find($floorId);

        if(!$building) throw new Exception("Data lantai tidak ditemukan");

        return $building->rooms()->select('id', 'name')
                ->get()  
                ->map(function ($floor) {
                    return [
                        'value' => $floor->id,
                        'label' => $floor->name
                    ];
                });

    }

}
