<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Order;
use App\Models\Item;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SellInfo>
 */
class SellInfoFactory extends Factory
{
    public function definition(): array
    {
        return [
            'order_id' => Order::factory(),
            'item_id' => Item::factory(),
            'sell_qty' => fake()->numberBetween(1, 100),
            'sell_price' => fake()->randomFloat(2, 10, 3000),
        ];
    }
}
