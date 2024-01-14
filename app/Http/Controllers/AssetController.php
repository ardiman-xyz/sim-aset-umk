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
use Illuminate\Support\Facades\Storage;

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
        }, 'categories', 'condition'])->orderBy("id", "desc")->get();

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
        $conditions = Condition::all("id", "name");
        $acquisitionMethods = AcquisitionMethod::all("id", "name");
        $categories = Category::all("id", "name");

        $asset = Asset::findOrFail($id)->load('gallery', 'categories', 'condition', 'acquisitionMethod');
        return Inertia::render('Asset/Show', compact("asset", "conditions", "acquisitionMethods", "categories"));
    }

    public function update(Request $request, string $id) 
    {
        $validatedData = $request->validate([
            'value' => 'required', 
            'item' => 'required|string|max:255', 
        ]);

        $value = $validatedData['value'];
        $item = $validatedData['item'];

        $asset = Asset::findOrFail($id);
        $asset->$item = $value;

        if($item === "quantity")
        {
            $total = ((int)$asset->$item * $asset->purchase_price);
            $asset->total_price = $total;
        }

        if($item === "purchase_price")
        {
            $total = ((int)$asset->$item * $asset->quantity);
            $asset->total_price = $total;
        }
        

        try {
            if($asset->save())
            {
                return response()->json([
                    'status' => true,
                    'message' => 'Successfully updated',
                    'data' => $asset
                ], 200);
            }else{
                return response()->json([
                    'status' => false,
                    'message' => 'Gagal mengupdate',
                    'data' => []
                ], 400);
            }
        }catch (Exception $exception)
        {
            return response()->json([
                'success'    => false,
                'message'   => "Something went wrong!"
            ], 400);
        }

    }

    public function updateCategory(Request $request, string $id)
    {
        $validatedData = $request->validate([
            'value' => 'required', 
        ]);

        $value = $validatedData['value'];

        $asset = Asset::findOrFail($id);
        $asset->categories()->sync($value);

        return response()->json([
            'status' => true,
            'message' => 'Successfully updated',
            'data' => $asset
        ], 200);

    }

    public function destroy(string $id)
    {
        $asset = Asset::findOrFail($id);
        
        $asset->categories()->detach();

        $asset->gallery()->delete();

        
        foreach ($asset->gallery as $image) {
            Storage::delete("public/".$image->file);
    
            $image->delete();
        }
   
        $asset->delete();

        return response()->json([
            'status' => true,
            'message' => 'Successfully deleted',
            'data' => []
        ], 200);
    }


}
