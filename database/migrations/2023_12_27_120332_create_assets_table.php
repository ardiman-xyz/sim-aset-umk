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
        Schema::create('assets', function (Blueprint $table) {
            $table->uuid("id")->primary();
            $table->unsignedBigInteger("acquisition_method_id");
            $table->unsignedBigInteger("condition_id");
            $table->string("name");
            $table->date("date_of_purchase");
            $table->integer("purchase_price");
            $table->string("purchase_receipt")->nullable();
            $table->string("description")->nullable();
            $table->timestamps();

            $table->foreign("acquisition_method_id")->references("id")->on("acquisition_methods");
            $table->foreign("condition_id")->references("id")->on("conditions");
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assets');
    }
};
