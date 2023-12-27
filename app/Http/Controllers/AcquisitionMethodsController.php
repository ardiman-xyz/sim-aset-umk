<?php

namespace App\Http\Controllers;

use App\Services\AcquisitionMethodsService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response as InertiaView;
use Exception;

class AcquisitionMethodsController extends Controller
{
    private AcquisitionMethodsService $acquisitionMethodsService;

    public function __construct()
    {
        $this->acquisitionMethodsService = new AcquisitionMethodsService();
    }

    public function index(): InertiaView
    {
        $data = $this->acquisitionMethodsService->findAll();

        return Inertia::render("Acquisition/Page", [
            "acquisitions" => $data
        ]);
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            "name" => ['required']
        ]);

        try {
            $name = $request->input("name");

            $response = $this->acquisitionMethodsService->create($name);
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

            $response = $this->acquisitionMethodsService->update($name, $id);
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
            $this->acquisitionMethodsService->deleteById($id);
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
