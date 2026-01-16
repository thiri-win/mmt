<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        "date",
        "customer_id",
        "location",
        "car_rent_cost",
        "grand_total",
        "count",
        "note",
    ];

    protected $casts = [
        'date' => 'datetime',
    ];

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }

    public function buyinfos()
    {
        return $this->hasMany(BuyInfo::class);
    }

    public function sellinfos()
    {
        return $this->hasMany(SellInfo::class);
    }
}
