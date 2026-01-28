<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PDF Print</title>
    <style>
        @page {
            size: 177mm 216mm;
        }

        @font-face {
            font-family: 'padauk';
            src: url('{{ storage_path('fonts/Padauk-Regular.ttf') }}') format('truetype');
            font-weight: normal;
            font-style: normal;
        }

        * {
            font-family: 'padauk';
            font-size: 14px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        td,
        th {
            border: 1px solid #111;
            padding: 3px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        /* မျက်နှာသစ်ကူးဖို့ CSS */
        .page-break {
            page-break-after: always;
        }

        /* နောက်ဆုံးစာမျက်နှာမှာ အလွတ်စာမျက်နှာ ထပ်မထွက်အောင် */
        .page-break:last-child {
            page-break-after: never;
        }
    </style>
</head>

<body>
@php
    $totalrows = 16;
    $chunks = $groups->chunk($totalrows);
    $allPageTotals = []; // စာမျက်နှာအလိုက် Total တွေကို သိမ်းဖို့ array
    $grandTotalAllPages = 0; // စာမျက်နှာအားလုံးပေါင်း Grand Total
@endphp
@foreach ($chunks as $chunk)
    <div class="page-break">
        @php
            $columnSum = 0;
        @endphp
        <table>
            <thead>
            <tr>
                <th>နေ့စွဲ</th>
                <th>နေရာ</th>
                <th>အမျိုးအစား</th>
                <th>ခေါက်ရေ</th>
                <th>စုစုပေါင်း</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($chunk as $order)
                @php
                    $columnSum += (float) $order->grand_total;
                @endphp
                <tr style="vertical-align: middle;">
                    <td>{{ $order->date->format('d-m-y') }}</td>
                    <td>{{ $order->location }}</td>
                    <td>
                        @foreach ($order->sellinfos as $index => $info)
                            {{ $info->item?->name }}@if ($index < count($order->sellinfos) - 1)
                                +
                            @endif
                        @endforeach
                    </td>
                    <td>{{ $order->count }}</td>
                    <td style="text-align: right">{{ number_format($order->grand_total) }}</td>
                </tr>
            @endforeach
            @php
                $remainingRows = $totalrows - count($chunk);
            @endphp
            @for ($i = 0; $i < $remainingRows; $i++)
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            @endfor
            </tbody>
            <tfoot>
            <tr>
                <td colspan="3" style="border: 0;">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640" style="width: 15px;">
                        <!--!Font Awesome Free 7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2026 Fonticons, Inc.-->
                        <path
                            d="M528 320C528 205.1 434.9 112 320 112C205.1 112 112 205.1 112 320C112 434.9 205.1 528 320 528C434.9 528 528 434.9 528 320zM64 320C64 178.6 178.6 64 320 64C461.4 64 576 178.6 576 320C576 461.4 461.4 576 320 576C178.6 576 64 461.4 64 320zM241.3 383.4C256.3 399 282.4 416 320 416C357.6 416 383.7 399 398.7 383.4C407.9 373.8 423.1 373.5 432.6 382.7C442.1 391.9 442.5 407.1 433.3 416.6C411.2 439.6 373.3 464 320 464C266.7 464 228.8 439.6 206.7 416.6C197.5 407 197.8 391.8 207.4 382.7C217 373.6 232.2 373.8 241.3 383.4zM208 272C208 254.3 222.3 240 240 240C257.7 240 272 254.3 272 272C272 289.7 257.7 304 240 304C222.3 304 208 289.7 208 272zM400 240C417.7 240 432 254.3 432 272C432 289.7 417.7 304 400 304C382.3 304 368 289.7 368 272C368 254.3 382.3 240 400 240z" />
                    </svg>
                    အားပေးမှုကို ကျေးဇူးတင်ပါသည်
                </td>
                <td style="text-align: right; font-weight: bold;">
                    သင့်ငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    {{ number_format($columnSum) }}
                </td>
            </tr>
            <tr>
                <td style="border: 0;">
                    လက်မှတ်
                </td>
                <td style="border:0;">
                </td>
                <td style="border: 0;"></td>
                <td style="text-align: right; font-weight: bold;">
                    စရံငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    0
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: 0;border-bottom: 1px solid #111;"></td>
                <td style="border: 0;"></td>
                <td style="text-align: right; font-weight: bold;">
                    ကျန်ငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    0
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
    @php
        // ယခုစာမျက်နှာရဲ့ total ကို array ထဲ ထည့်သိမ်းမယ်
        $allPageTotals[] = $columnSum;
        $grandTotalAllPages += $columnSum;
    @endphp
@endforeach

{{-- Loop အကုန်လုံး ပြီးသွားတဲ့အခါ နောက်ဆုံးမှာ စာမျက်နှာ ၁ ခုထက်ပိုမှ Summary Page ထုတ်မည် --}}
@if (count($chunks) > 1)
    <div class="page-break">
        <table>
            <thead>
            <tr>
                <th style="width: 70px;">စဉ်</th>
                <th colspan="3">အကြောင်းအရာ</th>
                <th>စုစုပေါင်း</th>
            </tr>
            </thead>
            <tbody>
            @foreach ($allPageTotals as $index => $subTotal)
                <tr>
                    <td style="text-align: center;">{{ $index + 1 }}</td>
                    <td colspan="3" style="padding-left: 20px;">Voucher {{ $index + 1 }}</td>
                    <td style="text-align: right; padding-right: 20px;">{{ number_format($subTotal) }}</td>
                </tr>
            @endforeach

            {{-- ၂။ Summary Row ၁၀ ခုပြည့်အောင် အလွတ်ဖြည့်မယ် --}}
            @php
                $summaryRemainingRows = $totalrows - count($allPageTotals);
            @endphp

            @for ($i = 0; $i < $summaryRemainingRows; $i++)
                <tr>
                    <td style="text-align: center;">{{ count($allPageTotals) + $i + 1 }}</td>
                    <td colspan="3"></td>
                    <td></td>
                </tr>
            @endfor
            </tbody>
            <tfoot>
            <tr>
                <td colspan="2" style="border: 0;">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640" style="width: 15px;">
                        <!--!Font Awesome Free 7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2026 Fonticons, Inc.-->
                        <path
                            d="M528 320C528 205.1 434.9 112 320 112C205.1 112 112 205.1 112 320C112 434.9 205.1 528 320 528C434.9 528 528 434.9 528 320zM64 320C64 178.6 178.6 64 320 64C461.4 64 576 178.6 576 320C576 461.4 461.4 576 320 576C178.6 576 64 461.4 64 320zM241.3 383.4C256.3 399 282.4 416 320 416C357.6 416 383.7 399 398.7 383.4C407.9 373.8 423.1 373.5 432.6 382.7C442.1 391.9 442.5 407.1 433.3 416.6C411.2 439.6 373.3 464 320 464C266.7 464 228.8 439.6 206.7 416.6C197.5 407 197.8 391.8 207.4 382.7C217 373.6 232.2 373.8 241.3 383.4zM208 272C208 254.3 222.3 240 240 240C257.7 240 272 254.3 272 272C272 289.7 257.7 304 240 304C222.3 304 208 289.7 208 272zM400 240C417.7 240 432 254.3 432 272C432 289.7 417.7 304 400 304C382.3 304 368 289.7 368 272C368 254.3 382.3 240 400 240z" />
                    </svg>
                    အားပေးမှုကို ကျေးဇူးတင်ပါသည်
                </td>
                <td colspan="2" style="text-align: right; font-weight: bold;">
                    သင့်ငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    {{ number_format($grandTotalAllPages) }}
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: 0;">
                    လက်မှတ်
                </td>
                <td colspan="2" style="text-align: right; font-weight: bold;">
                    စရံငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    0
                </td>
            </tr>
            <tr>
                <td colspan="2" style="border: 0;border-bottom: 1px solid #111;"></td>
                <td colspan="2" style="text-align: right; font-weight: bold;">
                    ကျန်ငွေ
                </td>
                <td style="text-align: right; font-weight: bold;">
                    0
                </td>
            </tr>
            </tfoot>
        </table>
    </div>
@endif
</body>

</html>
