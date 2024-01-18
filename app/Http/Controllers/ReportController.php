<?php

namespace App\Http\Controllers;

use App\Models\Asset;
use App\Models\Building;
use App\Models\Placement;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ReportController extends Controller
{
    public function index()
    {

        $buildings = Building::all("id", "name");

        $buildings = $buildings->map(function ($building) {
            return ['value' => $building->id, 'label' => $building->name];
        });

        return Inertia::render("Report/Index", compact("buildings"));
    }

    public function filter(Request $request)
    {
        $building = $request->input('building'); 
        $floor = $request->input('floor');
        $room = $request->input('room');
        
        $placements = Placement::with('asset'); 
  
        if($building) {
           $placements->where('building_id', $building);
        }  
      
        if($floor) {
           $placements->where('floor_id', $floor);
        }

        if($room) {
            $placements->where('room_id', $room);
         }
      
        $assets = $placements->get();
        
        
        return response()->json($assets);
        
    }

    public function print(Request $request) 
    {
        $building = $request->input('building');
        $floor = $request->input('floor');
        $room = $request->input('room');
        
        $placements = Placement::select('placements.*')
            ->join('buildings', 'placements.building_id', '=', 'buildings.id')
            ->join('floors', 'placements.floor_id', '=', 'floors.id') 
            ->join('rooms', 'placements.room_id', '=', 'rooms.id')
            ->with('asset');
        
        if($building) {
            $placements->where('placements.building_id', $building); 
        }
        
        if($floor) {
            $placements->where('placements.floor_id', $floor);
        }
        
        if($room) {
            $placements->where('placements.room_id', $room);
        }
        
        $assets = $placements->get();

        return Inertia::render("Report/Print", [
            "placements" => $assets,
            "building_name" => $assets[0]->building->name ?? null,
            "floor_name" => $assets[0]->floor->name ?? null,
            "room_name" => $assets[0]->room->name ?? null
        ]);  
    }
    

}
