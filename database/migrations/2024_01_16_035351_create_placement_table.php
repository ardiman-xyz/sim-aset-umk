<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('placements', function (Blueprint $table) {
            $table->uuid("id")->primary();
            $table->uuid("asset_id");
            $table->unsignedBigInteger("building_id");
            $table->unsignedBigInteger("floor_id")->nullable();
            $table->unsignedBigInteger("room_id")->nullable();
            $table->string("code");
            $table->text("description")->nullable();
            $table->date("placement_date");
            $table->timestamps();

            $table->foreign("asset_id")->references("id")->on("assets");
            $table->foreign("building_id")->references("id")->on("buildings");
            $table->foreign("floor_id")->references("id")->on("floors");
            $table->foreign("room_id")->references("id")->on("rooms");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('placements');
    }
};
