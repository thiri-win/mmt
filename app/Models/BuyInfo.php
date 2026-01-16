<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BuyInfo extends Model
{
    use HasFactory;
    
    protected $fillable = ['order_id', 'dealer_id', 'item_id', 'buy_qty', 'buy_price'];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }
    
    public function dealer()
    {
        return $this->belongsTo(Dealer::class);
    }
}
