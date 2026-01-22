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
        Schema::create('sell_infos', function (Blueprint $table) {
            $table->id();
            $table->foreignId("order_id")->constrained();
            $table->foreignId("item_id")->constrained();
            $table->decimal("sell_qty", 15,2)->nullable();
            $table->integer("sell_price")->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sell_infos');
    }
};
