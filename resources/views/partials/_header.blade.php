<style>
    @font-face {
        font-family: 'padauk';
        src: url('{{ storage_path('fonts/Padauk-Regular.ttf') }}') format('truetype');
        font-weight: normal;
        font-style: normal;
    }

    * {
        padding: 0;
        margin: 0;
        box-sizing: border-box;
        font-family: 'padauk';
        font-size: 14px;
        line-height: 1.7;
    }

    header {
        width: 100%;
        padding: 0px 25px;
        padding-top: 25px;
    }

    .heading {
        text-align: center;
        margin-bottom: 10px;
    }

    .heading h1 {
        font-size: 18px;
    }

    .heading h2 {
        font-size: 16px;
    }

    .heading p {
        font-size: 15px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    td {
        /* border: 1px solid green; */
        width: 10%;
        padding: 3px;
    }

    td:nth-child(2n) {
        width: 40%;
        border-bottom: 1px solid #000;
    }
</style>

<header>
    <div class="heading">
        <h1>ကိုမောင်မောင်သန်း နှင့် ညီအကိုများ</h1>
        <h2>ဘိလပ်မြေ၊ အုတ်၊ သဲ၊ ကျောက် ရောင်းဝယ် သယ်ယူပို့ဆောင်ရေး</h2>
        <p>&phone; 09-443060657, 09-788464997, 09-5167659, 09-443903985</p>
    </div>
    <table>
        <tr>
            <td>
                <label for="Customer">အမည်</label>
            </td>
            <td>
                <span>{{ $customer->name ?? '' }}</span>
            </td>
            <td>
                <label for="date">နေ့စွဲ</label>
            </td>
            <td>
                <span>{{$date->format('M-Y')}}</span>
            </td>
        </tr>
        <tr>
            <td>
                <label for="">အကြောင်းအရာ</label>
            </td>
            <td colspan="3">
                <span></span>
            </td>
        </tr>
    </table>
</header>
