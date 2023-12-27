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
    });

});

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
