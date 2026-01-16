<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Customer;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    public function definition(): array
    {
        return [
            'date' => fake()->dateTimeBetween('-1 year', 'now')->format('Y-m-d'),
            'customer_id' => Customer::factory(),
            'location' => fake()->city(),
            'car_rent_cost' => fake()->randomFloat(2, 0, 500),
            'grand_total' => fake()->randomFloat(2, 100, 5000),
            'count' => fake()->numberBetween(1, 10),
            'note' => fake()->optional()->sentence(),
        ];
    }
}
