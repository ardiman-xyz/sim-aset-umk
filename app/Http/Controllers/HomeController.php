<?php

namespace App\Http\Controllers;

use App\Models\Asset;
use App\Models\Building;
use App\Models\Floor;
use App\Models\Room;
use Illuminate\Http\Request;
use Inertia\Inertia;

class HomeController extends Controller
{
    public function index(Request $request)
    {
        // Retrieve filters from the request
        $buildingId = $request->input('building_id');
        $floorId = $request->input('floor_id');
        $roomId = $request->input('room_id');

        // Build query based on filters
        $query = Asset::query()->with('gallery');

        if ($buildingId) {
            $query->whereHas('placements', function ($q) use ($buildingId) {
                $q->where('building_id', $buildingId);
            });
        }

        if ($floorId) {
            $query->whereHas('placements', function ($q) use ($floorId) {
                $q->where('floor_id', $floorId);
            });
        }

        if ($roomId) {
            $query->whereHas('placements', function ($q) use ($roomId) {
                $q->where('room_id', $roomId);
            });
        }

        $assets = $query->get();

        // Retrieve all buildings, floors, and rooms for filter dropdowns
        $buildings = Building::all();
        $floors = Floor::all();
        $rooms = Room::all();

        return Inertia::render('Welcome', [
            'assets' => $assets,
            'buildings' => $buildings,
            'floors' => $floors,
            'rooms' => $rooms,
        ]);
    }
}
