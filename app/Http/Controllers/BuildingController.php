<?php

namespace App\Http\Controllers;

use App\Services\BuildingService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response as InertiaResponseView;
use Exception;

class BuildingController extends Controller
{
    private BuildingService $buildingService;

    public function __construct()
    {
        $this->buildingService = new BuildingService();
    }

    public function index(): InertiaResponseView
    {
        $buildings = $this->buildingService->findAll();

        return Inertia::render("Building/Page", [
            "buildings" => $buildings
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
           "name" => ['required']
        ]);

        try {
            $response = $this->buildingService->create($request->input("name"));
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

    public function update(Request $request, string $id): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $response = $this->buildingService->update($id, $request->input("name"));
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
            $this->buildingService->deleteById($id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully deleted!',
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
