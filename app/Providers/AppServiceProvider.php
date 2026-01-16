<?php

namespace App\Providers;

use App\Faker\BurmeseProvider;
use Illuminate\Support\ServiceProvider;
use Faker\Generator as FakerGenerator;
use Faker\Factory as FakerFactory;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        $this->app->singleton(FakerGenerator::class, function() {
            $faker = FakerFactory::create();
            $faker->addProvider(new BurmeseProvider($faker));
            return $faker;
        });
    }
}
