<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Order;
use App\Models\Dealer;
use App\Models\Item;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\BuyInfo>
 */
class BuyInfoFactory extends Factory
{
    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'dealer_id' => Dealer::factory(),
            'item_id' => Item::factory(),
            'buy_qty' => fake()->numberBetween(0, 1.5),
            'buy_price' => fake()->randomFloat(0, 10, 2000),
        ];
    }
}
