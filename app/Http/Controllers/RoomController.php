<?php

namespace App\Http\Controllers;

use App\Services\RoomService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Exception;

class RoomController extends Controller
{
    private RoomService $roomService;

    public function __construct()
    {
        $this->roomService = new RoomService();
    }

    public function index(string $floor_id)
    {
        try {

            $data = $this->roomService->findByFloorId($floor_id);

            return Inertia::render("Room/Page", [
                "data" => $data
            ]);

        }catch (Exception $exception)
        {
            abort(404);
        }
    }

    public function store(Request $request, string $floor_id): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $response = $this->roomService->create($request->input("name"), $floor_id);
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

    public function update(Request $request, string $floor_id, string $id): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $response = $this->roomService->update($request->input("name"), $floor_id, $id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully update',
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
            $this->roomService->deleteById($id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully deleted',
                'data' =>[]
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
