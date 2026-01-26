<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Customer;
use App\Models\Dealer;
use App\Models\Item;
use App\Models\Order;
use App\Models\BuyInfo;
use App\Models\SellInfo;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Create an admin user, then additional random users
        User::factory()->create([
            'name' => 'Thiri Win',
            'email' => 'admin@gmail.com',
            'password' => Hash::make('pass'),
            'email_verified_at' => now(),
            'two_factor_secret' => null,
        ]);

        $customers = ['ပြည့်ဝစေ', 'နောင်ရိုး', 'ကိုကျော်ဝေ', 'ကောင်းမြတ်သာ', 'နေလ', 'ကျော်မြင့်', 'ဝင်းဇော်', 'ကြည်နိုင်', 'ရွှေအိမ်', 'အိမ်အော်ဒါ', 'အဘအောင်', 'လက်ငင်း',];
        $dealers = ['မျိုးမြန်မာ', 'မိုးမြင့်ကြယ်', 'စံတင်', 'ဦးပြား', 'စိန်ရွှေမိုး', 'ရွာမ', 'အဘအောင်', 'မလိခ', 'ငွေအိမ်စံ',];
        $items = ['အုတ်', 'သဲ', 'ကျောက်', 'ဘိလပ်မြေ'];

        foreach ($customers as $customer) {
            Customer::factory()->create([
                'name' => $customer,
            ]);
        }
        foreach ($dealers as $dealer) {
            Dealer::factory()->create([
                'name' => $dealer,
            ]);
        }
        foreach ($items as $item) {
            Item::factory()->create([
                'name' => $item,
            ]);
        }

//        User::factory(9)->create();

        // Create domain data via factories
//        Customer::factory(30)->create();
//        Dealer::factory(10)->create();
//        Item::factory(50)->create();
//        Order::factory(40)->create();
//        BuyInfo::factory(40)->create();
//        SellInfo::factory(40)->create();
    }
}
