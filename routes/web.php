<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', [HomeController::class, 'index'])->name("home.index");


Route::middleware(['auth'])->group(function () {

    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::get('/data', [DashboardController::class, 'resultData'])->name('dashboard.dt');

    Route::prefix("building")->group(function () {
        Route::get("/", [\App\Http\Controllers\BuildingController::class, 'index'])->name("building.index");
        Route::post("/", [\App\Http\Controllers\BuildingController::class, 'store'])->name("building.store");
        Route::put("{id}", [\App\Http\Controllers\BuildingController::class, 'update'])->name("building.edit");
        Route::delete("{id}", [\App\Http\Controllers\BuildingController::class, 'destroy'])->name("building.destroy");


        Route::get("{building_id}/floor", [\App\Http\Controllers\FloorController::class, 'index'])->name("floor.index");
        Route::post("{building_id}/floor", [\App\Http\Controllers\FloorController::class, 'store'])->name("floor.store");
        Route::put("{building_id}/floor/{id}", [\App\Http\Controllers\FloorController::class, 'update'])->name("floor.update");
        Route::delete("floor/{id}", [\App\Http\Controllers\FloorController::class, 'destroy'])->name("floor.destroy");

        Route::get("{floor_id}/room", [\App\Http\Controllers\RoomController::class, 'index'])->name("room.index");
        Route::post("{floor_id}/room", [\App\Http\Controllers\RoomController::class, 'store'])->name("room.store");
        Route::put("{floor_id}/room/{id}", [\App\Http\Controllers\RoomController::class, 'update'])->name("room.update");
        Route::delete("room/{id}", [\App\Http\Controllers\RoomController::class, 'destroy'])->name("room.destroy");
    });

    Route::prefix("categories")->group(function () {
        Route::get("/", [\App\Http\Controllers\CategoriesItemController::class, 'index'])->name("category.index");
        Route::post("/", [\App\Http\Controllers\CategoriesItemController::class, 'store']);
        Route::put("{id}", [\App\Http\Controllers\CategoriesItemController::class, 'update']);
        Route::delete("{id}", [\App\Http\Controllers\CategoriesItemController::class, 'destroy']);
    });

    Route::prefix("conditions")->group(function () {
        Route::get("/", [\App\Http\Controllers\ConditionItemController::class, 'index'])->name("condition.index");
        Route::post("/", [\App\Http\Controllers\ConditionItemController::class, 'store']);
        Route::put("{id}", [\App\Http\Controllers\ConditionItemController::class, 'update']);
        Route::delete("{id}", [\App\Http\Controllers\ConditionItemController::class, 'destroy']);
    });

    Route::prefix("acquisition-methods")->group(function () {
        Route::get("/", [\App\Http\Controllers\AcquisitionMethodsController::class, 'index'])->name("acquisition.index");
        Route::post("/", [\App\Http\Controllers\AcquisitionMethodsController::class, 'store']);
        Route::put("{id}", [\App\Http\Controllers\AcquisitionMethodsController::class, 'update']);
        Route::delete("{id}", [\App\Http\Controllers\AcquisitionMethodsController::class, 'destroy']);
    });

    Route::prefix("assets")->group(function () {
        Route::get("/", [\App\Http\Controllers\AssetController::class, 'index'])->name("asset.index");
        Route::get("create", [\App\Http\Controllers\AssetController::class, 'create'])->name("asset.create");
        Route::get("{id}", [\App\Http\Controllers\AssetController::class, 'show'])->name("asset.show");
        Route::post("/", [\App\Http\Controllers\AssetController::class, 'store'])->name("asset.store");
        Route::put("item/{id}", [\App\Http\Controllers\AssetController::class, 'update'])->name("asset.update");
        Route::put("categories/{id}", [\App\Http\Controllers\AssetController::class, 'updateCategory']);
        Route::delete("{id}", [\App\Http\Controllers\AssetController::class, 'destroy'])->name("asset.delete");

        Route::get("{building_id}/floors", [\App\Http\Controllers\AssetController::class, 'floors']);
        Route::get("{building_id}/rooms", [\App\Http\Controllers\AssetController::class, 'rooms']);

        Route::prefix("placement")->group(function () {
            Route::post("{asset_id}", [\App\Http\Controllers\AssetController::class, 'createPlacement']);
            Route::delete("{id}", [\App\Http\Controllers\AssetController::class, 'deletePlacement']);
        });
    });

    Route::prefix("reports")->group(function () {
        Route::get("/", [\App\Http\Controllers\ReportController::class, 'index'])->name("report.index");
        Route::get("filter", [\App\Http\Controllers\ReportController::class, 'filter'])->name("report.filter");
        Route::get("print", [\App\Http\Controllers\ReportController::class, 'print'])->name("report.print");
    });


    Route::prefix("users")->group(function () {
        Route::get("/", [\App\Http\Controllers\UserController::class, 'index'])->name("user.index");
        Route::post("/", [\App\Http\Controllers\UserController::class, 'store'])->name("user.store");
        Route::put("{id}", [\App\Http\Controllers\UserController::class, 'update'])->name("user.update");
    });

});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
