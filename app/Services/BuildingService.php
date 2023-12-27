<?php

namespace App\Services;

use App\Models\Building;
use Illuminate\Database\Eloquent\Collection;
use Exception;

class BuildingService
{

    public function findAll(): Collection
    {
        return Building::orderBy("id", "desc")->get();
    }

    public function create(string $name)
    {
        return Building::create([
           "name" => $name
        ]);
    }

    public function findById(string $id)
    {
        return Building::find($id);
    }

    /**
     * @throws Exception
     */
    public function update(string $id, string $name)
    {
        $building = $this->findById($id);
        if(!$building) throw new Exception("Gedung tidak ditemukan");


        $building->name = $name;
        $building->save();

        return $building;
    }

    /**
     * @throws Exception
     */
    public function deleteById(string $id): void
    {
        $building = $this->findById($id);
        if(!$building) throw new Exception("Gedung tidak ditemukan");

        $building->delete();
    }
}
