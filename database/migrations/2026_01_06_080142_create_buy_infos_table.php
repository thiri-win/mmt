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
        Schema::create('buy_infos', function (Blueprint $table) {
            $table->id();
            $table->foreignId("order_id")->constrained();
            $table->foreignId("dealer_id")->constrained();
            $table->foreignId("item_id")->constrained();
            $table->decimal("buy_qty", 15, 2);
            $table->decimal("buy_price", 15, 2);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('buy_infos');
    }
};
