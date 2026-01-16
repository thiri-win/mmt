<?php

namespace App\Faker;

use Faker\Provider\Base;

class BurmeseProvider extends Base
{
    protected static $company = [
        'ရွှေမြန်မာ ကုန်သွယ်ရေး',
        'အောင်ကမ္ဘာ ဆောက်လုပ်ရေး',
        'နန်းထိုက်တော် ပွဲရုံ',
        'မြတ်မွန် ကုမ္ပဏီ',
        'စိန်ပန်း Group',
        'ယူနတီ သယ်ယူပို့ဆောင်ရေး',
        'ဦးလှိုင် ဒိုင်',
        'အောင်သမာဓိ ပွဲရုံ',
        'ရွှေစင် အရောင်းဆိုင်',
        'ကိုမင်းမင်း ဆိုင်'
    ];

    protected static $township = [
        'အင်းစိန်မြို့နယ်',
        'လှိုင်သာယာမြို့နယ်',
        'ပြည်ကြီးတံခွန်မြို့နယ်',
        'မရမ်းကုန်းမြို့နယ်',
        'တောင်ဥက္ကလာပမြို့နယ်',
        'မရမ်းကုန်းမြို့နယ်'
    ];

    protected static $name = [
        'ဦးလှိုင်',
        'ဒေါ်အေး',
        'ကိုမင်းမင်း',
        'မသီတာ',
        'မောင်ကျော်',
        'ဒေါ်နန်းမူ'
    ];

    protected static $sellItem = [
        'အုတ်',
        'သဲ',
        'ကျောက်',
        'ဘိလပ်မြေ',
    ];

    public function mmCompany() {return static::randomElement(static::$company);}
    public function mmTownship() {return static::randomElement(static::$township);}
    public function mmName() {return static::randomElement(static::$name);}
    public function mmSellItem() {return static::randomElement(static::$sellItem);}

}
