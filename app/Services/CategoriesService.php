<?php

namespace App\Services;

use App\Models\Category;
use Exception;

class CategoriesService
{

    public function findAll()
    {
        return Category::orderBy("id", "desc")->get();
    }

    /**
     * @throws Exception
     */
    public function create(string $name)
    {
        $alreadyExist = $this->findByName($name);
        if($alreadyExist) throw new Exception("Kategori $name sudah ada");

        return Category::create([
           "name" => $name
        ]);
    }

    public function findByName(string $name)
    {
        return Category::where("name", $name)->first();
    }

    public function findById(string $id)
    {
        return Category::find($id);
    }

    public function update(string $name, string $id)
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Kategori tidak ditemukan");

        $existingCategory = Category::where('name', $name)->where('id', '!=', $id)->first();
        if($existingCategory) throw new Exception("Kategori $name sudah ada");

        $category->name = $name;
        $category->save();

        return $category;

    }

    public function deleteById(string $id): void
    {
        $category = $this->findById($id);
        if(!$category) throw new Exception("Kategori tidak ditemukan");

        $category->delete();
    }
}
