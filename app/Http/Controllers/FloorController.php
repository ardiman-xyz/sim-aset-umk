<?php

namespace App\Http\Controllers;

use App\Services\FloorService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Exception;
use Inertia\Inertia;
use Inertia\Response as InertiaResponseView;

class FloorController extends Controller
{
    private FloorService $floorService;

    public function __construct()
    {
        $this->floorService = new FloorService();
    }

    public function index(string $building_id)
    {
        try {

            $building = $this->floorService->findByBuildingId($building_id);

            return Inertia::render("Floor/Page", [
                "building" => $building
            ]);

        }catch (Exception $exception)
        {
            abort(404);
        }
    }

    public function store(Request $request, string $building_id): JsonResponse
    {
        try {
            $response = $this->floorService->create($request->input("name"), $building_id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully created',
                'data' => $response
            ], 201);
        }catch (Exception $exception)
        {
            return response()->json([
                'success'    => false,
                'message'   => $exception->getMessage()
            ], 400);
        }
    }

    public function update(Request $request, string $building_id, string $id): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $name = $request->input("name");

            $response = $this->floorService->update($name, $building_id, $id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully updated',
                'data' => $response
            ], 200);
        }catch (Exception $exception)
        {
            return response()->json([
                'success'    => false,
                'message'   => $exception->getMessage()
            ], 400);
        }
    }

    public function destroy(string $id): JsonResponse
    {
        try {
            $this->floorService->deleteById($id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully deleted',
                'data' => []
            ], 200);
        }catch (Exception $exception)
        {
            return response()->json([
                'success'    => false,
                'message'   => $exception->getMessage()
            ], 400);
        }
    }
}
