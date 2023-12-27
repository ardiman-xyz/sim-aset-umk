<?php

namespace App\Http\Controllers;

use App\Services\CategoriesService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Exception;
use Inertia\Response as InertiaView;

class CategoriesItemController extends Controller
{
    private CategoriesService $categoriesService;

    public function __construct()
    {
        $this->categoriesService = new CategoriesService();
    }

    public function index(): InertiaView
    {
        $categories = $this->categoriesService->findAll();

        return Inertia::render("Category/Page", [
            "categories" => $categories
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $name = $request->input("name");

            $response = $this->categoriesService->create($name);
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

            $response = $this->categoriesService->update($name, $id);
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
          $this->categoriesService->deleteById($id);
            return response()->json([
                'status' => true,
                'message' => 'Successfully updated',
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
