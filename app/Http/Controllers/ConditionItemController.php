<?php

namespace App\Http\Controllers;

use App\Services\ConditionService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response as InertiaView;
use Exception;

class ConditionItemController extends Controller
{
    private ConditionService $conditionService;

    public function __construct()
    {
        $this->conditionService = new ConditionService();
    }

    public function index(): InertiaView
    {
        $data = $this->conditionService->findAll();

        return Inertia::render("Condition/Page", [
            "conditions" => $data
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $name = $request->input("name");

            $response = $this->conditionService->create($name);
            return response()->json([
                'status' => true,
                'message' => 'Successfully updated',
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
            $name = $request->input("name");

            $response = $this->conditionService->update($name, $id);
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
            $this->conditionService->deleteById($id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully deleted',
                'data' => []
            ], 201);
        }catch (Exception $exception)
        {
            return response()->json([
                'success'    => false,
                'message'   => $exception->getMessage()
            ], 400);
        }
    }
}
