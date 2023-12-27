<?php

namespace App\Services;
use App\Models\Floor;
use App\Models\Building;
use Exception;

class FloorService
{
    /**
     * @throws Exception
     */
    public function findByBuildingId(string $id)
    {
        $building = Building::with('floors')->find($id);

        if(!$building) throw new Exception("Gedung tidak ditemukan");

        return $building;
    }

    public function create(string $name, string $building_id)
    {
        $building = Building::find($building_id);
        if(!$building) throw new Exception("Gedung tidak ditemukan!");

        return Floor::create([
           "building_id" => $building_id,
            "name" => $name
        ]);
    }

    /**
     * @throws Exception
     */
    public function update(string $name, string $building_id, string $id)
    {
        $building = Building::find($building_id);
        if(!$building) throw new Exception("Gedung tidak ditemukan");

        $floor = Floor::find($id);
        if(!$floor) throw new Exception("Lantai tidak ditemukan");

        $floor->name = $name;
        $floor->save();

        return $floor;
    }

    public function deleteById(string $id): void
    {
        $floor = Floor::find($id);
        if(!$floor) throw new Exception("Lantai tidak ditemukan");

        $floor->delete();
    }
}
