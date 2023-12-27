<?php

namespace App\Services;

use App\Models\AcquisitionMethod;
use Exception;

class AcquisitionMethodsService
{
    public function findAll()
    {
        return AcquisitionMethod::orderBy("id", "desc")->get();
    }

    /**
     * @throws Exception
     */
    public function create(string $name)
    {
        $alreadyExist = $this->findByName($name);
        if($alreadyExist) throw new Exception("Metode Perolehan $name sudah ada");

        return AcquisitionMethod::create([
            "name" => $name
        ]);
    }

    public function findByName(string $name)
    {
        return AcquisitionMethod::where("name", $name)->first();
    }

    public function findById(string $id)
    {
        return AcquisitionMethod::find($id);
    }

    /**
     * @throws Exception
     */
    public function update(string $name, string $id)
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Metode Perolehan tidak ditemukan");

        $existingAcquisitionMethod = AcquisitionMethod::where('name', $name)->where('id', '!=', $id)->first();
        if($existingAcquisitionMethod) throw new Exception("Metode Perolehan $name sudah ada");

        $category->name = $name;
        $category->save();

        return $category;

    }

    /**
     * @throws Exception
     */
    public function deleteById(string $id): void
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Metode Perolehan tidak ditemukan");

        $category->delete();
    }
}
