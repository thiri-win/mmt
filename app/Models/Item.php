<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;

    protected $fillable = ["name", "note"];

    public function buyinfos()
    {
        return $this->hasMany(BuyInfo::class);
    }

    public function sellinfos()
    {
        return $this->hasMany(SellInfo::class);
    }
}
