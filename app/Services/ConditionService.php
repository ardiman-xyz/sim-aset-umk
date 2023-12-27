<?php

namespace App\Services;

use App\Models\Condition;
use Exception;

class ConditionService
{
    public function findAll()
    {
        return Condition::orderBy("id", "desc")->get();
    }

    /**
     * @throws Exception
     */
    public function create(string $name)
    {
        $alreadyExist = $this->findByName($name);
        if($alreadyExist) throw new Exception("Kondisi $name sudah ada");

        return Condition::create([
            "name" => $name
        ]);
    }

    public function findByName(string $name)
    {
        return Condition::where("name", $name)->first();
    }

    public function findById(string $id)
    {
        return Condition::find($id);
    }

    public function update(string $name, string $id)
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Kondisi tidak ditemukan");

        $existingCondition = Condition::where('name', $name)->where('id', '!=', $id)->first();
        if($existingCondition) throw new Exception("Kondisi $name sudah ada");

        $category->name = $name;
        $category->save();

        return $category;

    }

    public function deleteById(string $id): void
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Kondisi tidak ditemukan");

        $category->delete();
    }
}
