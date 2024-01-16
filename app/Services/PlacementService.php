<?php

namespace App\Services;

use App\Dto\CreatePlacementDTO;
use App\Models\Asset;
use App\Models\Building;
use App\Models\Floor;
use App\Models\Placement;
use App\Models\Room;
use Exception;
use Illuminate\Support\Str;

Class PlacementService {

    public function create(CreatePlacementDTO $data)
    {
        $asset = Asset::find($data->assetId);
        if(!$asset) throw new Exception("Aset tidak ditemukan");

        $building = Building::find($data->buildingId);
        if(!$building) throw new Exception("Gedung tidak ditemukan");

        $floor = Floor::find($data->floorId);
        if(!$floor) throw new Exception("Lantai tidak ditemukan");

        $room = Room::find($data->roomId);
        if(!$room) throw new Exception("Ruangan tidak ditemukan");

        $placement = Placement::create([
            "id"            => Str::uuid(),
            "asset_id"      => $data->assetId,
            "building_id"   => $data->buildingId,
            "floor_id"      => $data->floorId,
            "room_id"       => $data->roomId,
            "placement_date"=> $data->placementDate

        ]);

        return $placement;

    }

}