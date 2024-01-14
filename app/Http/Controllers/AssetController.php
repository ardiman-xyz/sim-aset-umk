<?php

namespace App\Http\Controllers;

use App\Dto\CreateAssetDTO;
use App\Http\Requests\CreateAssetRequest;
use App\Models\AcquisitionMethod;
use App\Models\Asset;
use App\Models\Category;
use App\Models\Condition;
use App\Services\AssetService;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response as ViewInertia;
use Exception;

class AssetController extends Controller
{

    private AssetService $assetService;

    public function __construct()
    {
        $this->assetService = new AssetService();
    }

    public function index(): ViewInertia
    {
        $assets = Asset::with(['gallery' => function ($query) {
            $query->first();
        }, 'categories', 'condition'])->get();

        $assets = $assets->map(function ($asset) {
            $asset->image = $asset->gallery->first() ? $asset->gallery->first()->file : null;
            $asset->category = $asset->categories->first() ? $asset->categories->first()->name : null;
            $asset->condition = $asset->condition ? $asset->condition->name : null;
            return $asset;
        });

        return Inertia::render("Asset/Page", compact("assets"));
    }

    public function create(): ViewInertia
    {
        $acquisitionMethods = AcquisitionMethod::all("id", "name");
        $categories = Category::all("id", "name");
        $conditions = Condition::all("id", "name");

        return Inertia::render("Asset/Create", compact("acquisitionMethods", "categories", "conditions"));
    }

    public function store(Request $request): JsonResponse
    {
        $dto = new CreateAssetDTO();
        $dto->name = $request->input('name');
        $dto->dateOfPurchase = $request->input('date_of_purchase');
        $dto->categoryId = $request->input('categories');
        $dto->acquisitionMethodId = $request->input('acquisition_methods');
        $dto->images = $request->file("images");
        $dto->conditionId = $request->input('condition');
        $dto->purchase_price = $request->input('purchase_price');
        $dto->quantity = $request->input('quantity');
        $dto->description = $request->input('description');

        try {
            $response = $this->assetService->create($dto);
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

    public function show(string $id): ViewInertia
    {
        $asset = Asset::findOrFail($id)->load('gallery', 'categories', 'condition');
        return Inertia::render('Asset/Show', ['asset' => $asset]);
    }

}
