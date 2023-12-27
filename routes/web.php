<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Foundation\Application;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});

Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', function () {
        return Inertia::render('Dashboard');
    })->name('dashboard');

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

});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
