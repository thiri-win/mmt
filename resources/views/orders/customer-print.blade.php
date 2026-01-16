<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>PDF Print</title>
    <style>
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
                        <tr>
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
                        <td colspan="4" style="text-align: right; font-weight: bold;">
                            သင့်ငွေ
                        </td>
                        <td style="text-align: right; font-weight: bold;">
                            {{ number_format($columnSum) }}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: right; font-weight: bold;">
                            စရံငွေ
                        </td>
                        <td style="text-align: right; font-weight: bold;">
                            0
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="text-align: right; font-weight: bold;">
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
                        <th style="width: 10%;">စဉ်</th>
                        <th style="width: 40%;">စာမျက်နှာ (Voucher)</th>
                        <th colspan="2" style="width: 50%;">စုစုပေါင်း ပမာဏ</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($allPageTotals as $index => $subTotal)
                        <tr>
                            <td style="text-align: center;">{{ $index + 1 }}</td>
                            <td style="padding-left: 20px;">Voucher {{ strtoupper(chr(65 + $index)) }} (Page - {{ $index + 1 }})</td>
                            <td colspan="2" style="text-align: right; padding-right: 20px;">{{ number_format($subTotal) }}</td>
                        </tr>
                    @endforeach

                    {{-- ၂။ Summary Row ၁၀ ခုပြည့်အောင် အလွတ်ဖြည့်မယ် --}}
                    @php
                        $summaryRemainingRows = $totalrows - count($allPageTotals);
                    @endphp

                    @for ($i = 0; $i < $summaryRemainingRows; $i++)
                        <tr>
                            <td style="text-align: center;">{{ count($allPageTotals) + $i + 1 }}</td>
                            <td>&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    @endfor
                </tbody>
                <tfoot>
                    <tr style="background-color: #f2f2f2;">
                        <td colspan="2" style="text-align: right; font-weight: bold; padding: 10px;">Voucher အားလုံး၏ စုစုပေါင်း (Grand Total) -</td>
                        <td colspan="2" style="text-align: right; font-weight: bold; padding-right: 20px;">
                            {{ number_format($grandTotalAllPages) }}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    @endif
</body>

</html>
