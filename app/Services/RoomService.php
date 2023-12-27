<?php

namespace App\Services;

use App\Models\Room;
USE App\Models\Floor;
use Exception;

class RoomService
{
    /**
     * @throws Exception
     */
    public function findByFloorId(string $id)
    {
        $floor = Floor::with("rooms", "building")->find($id);
        if(!$floor) throw new Exception("Gedung tidak ditemukan");

        return $floor;
    }

    public function findById(string $id)
    {
        return Room::find($id);
    }

    /**
     * @throws Exception
     */
    public function create(string $name, string $floor_id)
    {
        $floor = Floor::find($floor_id);
        if(!$floor) throw new Exception("Lantai tidak ditemukan!");

        return Room::create([
           "floor_id" => $floor_id,
           "name"   =>  $name
        ]);
    }

    /**
     * @throws Exception
     */
    public function update(string $name, string $floor_id, string $id)
    {
        $floor = Floor::find($floor_id);
        if(!$floor) throw new Exception("Lantai tidak ditemukan!");

        $room = $this->findById($id);
        if(!$room) throw new Exception("Ruangan tidak ditemukan!");

        $room->name = $name;
        $room->save();

        return $room;
    }

    /**
     * @throws Exception
     */
    public function deleteById(string $id): void
    {
        $room = $this->findById($id);
        if(!$room) throw new Exception("Ruangan tidak ditemukan!");

        $room->delete();
    }
}
