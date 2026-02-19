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
            font-size: 14px !important;
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        table {
            border-collapse: collapse;
            width: 99%;
        }

        td,
        th {
            border: 1px solid #111;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding: 0 5px;
        }

        td div {
            height: 7mm !important;
            overflow: hidden;
        }

        .page-break {
            page-break-after: always;
        }

        .page-break:last-child {
            page-break-after: never;
        }

        .border-b {
            border: 0;
            border-bottom: 1px solid #111;
        }

        .border-0 {
            border: 0;
        }

        .w-40 {
            width: 40%;
        }

        .w-35 {
            width: 35%;
        }

        .w-15 {
            width: 15%;
        }

        .text-right {
            text-align: right;
        }

        .text-center {
            text-align: center;
        }

        .font-bold {
            font-weight: bold;
        }

        .table-mb {
            margin-bottom: 15px;
        }
    </style>
</head>

<body>

    @php
        $allPageTotals = [];
        $grandTotalAllPages = 0;
        $romanMap = ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'];
        if ($group_by_location) {
            $chunks = $orderData;
        } else {
            $chunks = $orderData->chunk($totalRows);
        }
    @endphp

    @foreach ($chunks as $index => $chunk)
        @php $columnSum = 0; @endphp
        <div class="page-break">
            <table class="table-mb">
                <tbody>
                    <tr>
                        <td class="border-0 w-15">
                            <div><label for="Customer">အမည်</label></div>
                        </td>
                        <td class="border-b w-35">
                            <span>{{ $customer->name ?? '' }}</span>
                        </td>
                        <td class="border-0 w-15 text-right">
                            <label for="date">နေ့စွဲ</label>
                        </td>
                        <td class="border-b w-35">
                            <span>{{ \Carbon\Carbon::parse($date)->format('M-Y') }}</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="border-0">
                            <div><label for="">အကြောင်းအရာ</label></div>
                        </td>
                        <td colspan="3" class="border-b">
                            @if ($group_by_location)
                                <span>{{ $chunk->first()->location }}</span>
                            @elseif(count($chunks) > 1)
                                <span>Voucher {{ $romanMap[$index] ?? $index + 1 }}</span>
                            @else
                                <span></span>
                            @endif
                        </td>
                    </tr>
                </tbody>
            </table>

            <table>
                <thead>
                    <tr>
                        <th class="w-15">နေ့စွဲ</th>
                        <th class="w-40">နေရာ</th>
                        <th class="w-15">အမျိုးအစား</th>
                        <th class="w-15">ခေါက်ရေ</th>
                        <th class="w-15">စုစုပေါင်း</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($chunk as $key => $order)
                        @php
                            if ($group_by_date) {
                                $columnSum += (float) $order->sum('grand_total');
                            } else {
                                $columnSum += (float) $order->grand_total;
                            }
                        @endphp

                        <tr>
                            <td>
                                <div>
                                    {{ $group_by_date ? \Carbon\Carbon::parse($key)->format('d-m-Y') : $order->date->format('d-m-Y') }}
                                </div>
                            </td>

                            <td>
                                {{ $show_location && $group_by_date ? $order->pluck('location')->unique()->implode(',') : ($show_location ? $order->location : '') }}
                            </td>

                            <td>
                                @if ($show_item && $group_by_date)
                                    <span>{{ $order->flatMap->sellinfos->pluck('item.name')->unique()->implode(',') }}</span>
                                @elseif($show_item)
                                    <span>{{ $order->sellinfos->pluck('item.name')->unique()->implode(',') }}</span>
                                @else
                                    <span></span>
                                @endif
                            </td>
                            <td class="text-center">{{ $group_by_date ? $order->sum('count') : $order->count }}</td>
                            <td class="text-right">{{ number_format($group_by_date ? $order->sum('grand_total') : $order->grand_total) }}</td>
                        </tr>
                    @endforeach

                    @php
                        $remainingRows = $totalRows - count($chunk);
                    @endphp
                    @for ($i = 0; $i < $remainingRows; $i++)
                        <tr>
                            <td>
                                <div>&nbsp;</div>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    @endfor
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3" class="border-0 font-bold">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640" style="width: 15px;">
                                <!--!Font Awesome Free 7.1.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2026 Fonticons, Inc.-->
                                <path d="M528 320C528 205.1 434.9 112 320 112C205.1 112 112 205.1 112 320C112 434.9 205.1 528 320 528C434.9 528 528 434.9 528 320zM64 320C64 178.6 178.6 64 320 64C461.4 64 576 178.6 576 320C576 461.4 461.4 576 320 576C178.6 576 64 461.4 64 320zM241.3 383.4C256.3 399 282.4 416 320 416C357.6 416 383.7 399 398.7 383.4C407.9 373.8 423.1 373.5 432.6 382.7C442.1 391.9 442.5 407.1 433.3 416.6C411.2 439.6 373.3 464 320 464C266.7 464 228.8 439.6 206.7 416.6C197.5 407 197.8 391.8 207.4 382.7C217 373.6 232.2 373.8 241.3 383.4zM208 272C208 254.3 222.3 240 240 240C257.7 240 272 254.3 272 272C272 289.7 257.7 304 240 304C222.3 304 208 289.7 208 272zM400 240C417.7 240 432 254.3 432 272C432 289.7 417.7 304 400 304C382.3 304 368 289.7 368 272C368 254.3 382.3 240 400 240z" />
                            </svg>
                            အားပေးမှုကို ကျေးဇူးတင်ပါသည်
                        </td>
                        <td class="text-right font-bold">
                            သင့်ငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ number_format($columnSum) }}
                        </td>
                    </tr>
                    <tr>
                        <td class="border-0">
                            လက်မှတ်
                        </td>
                        <td class="border-0">
                        </td>
                        <td class="border-0"></td>
                        <td class="text-right font-bold">
                            စရံငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ $chunks->count() == 1 ? number_format($prepaid_amount ?? 0) : '' }}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="border-b"></td>
                        <td class="border-0"></td>
                        <td class="text-right font-bold">
                            ကျန်ငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ $chunks->count() == 1 ? number_format($columnSum - $prepaid_amount ?? 0) : '' }}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>

        @php
            $allPageTotals[] = $columnSum;
            $grandTotalAllPages += $columnSum;
        @endphp
    @endforeach

    @if (count($chunks) > 1)
        <div class="page-break">
            <table class="table-mb">
                <tr>
                    <td class="border-0 w-15">
                        <div><label for="Customer">အမည်</label></div>
                    </td>
                    <td class="border-b w-35">
                        <span>{{ $customer->name ?? '' }}</span>
                    </td>
                    <td class="border-0 w-15 text-right">
                        <label for="date">နေ့စွဲ</label>
                    </td>
                    <td class="border-b w-35">
                        <span>{{ \Carbon\Carbon::parse($date)->format('M-Y') }}</span>
                    </td>
                </tr>
                <tr>
                    <td class="border-0">
                        <div><label for="">အကြောင်းအရာ</label></div>
                    </td>
                    <td colspan="3" class="border-b"></td>
                </tr>
            </table>

            <table>
                <thead>
                    <tr>
                        <th class="w-15">စဉ်</th>
                        <th colspan="3" class="w-75">အကြောင်းအရာ</th>
                        <th class="w-15">စုစုပေါင်း</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($allPageTotals as $index => $subTotal)
                        <tr>
                            <td class="text-center">
                                <div>{{ $index + 1 }}</div>
                            </td>
                            <td colspan="3">Voucher {{ $romanMap[$index] ?? $index + 1 }}</td>
                            <td class="text-right">{{ number_format($subTotal) }}</td>
                        </tr>
                    @endforeach

                    @php
                        $summaryRemainingRows = $totalRows - count($allPageTotals);
                    @endphp

                    @for ($i = 0; $i < $summaryRemainingRows; $i++)
                        <tr>
                            <td class="text-center">
                                <div>{{ count($allPageTotals) + $i + 1 }}</div>
                            </td>
                            <td colspan="3"></td>
                            <td></td>
                        </tr>
                    @endfor
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="2" class="border-0">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 640" style="width: 15px;">
                                <path d="M528 320C528 205.1 434.9 112 320 112C205.1 112 112 205.1 112 320C112 434.9 205.1 528 320 528C434.9 528 528 434.9 528 320zM64 320C64 178.6 178.6 64 320 64C461.4 64 576 178.6 576 320C576 461.4 461.4 576 320 576C178.6 576 64 461.4 64 320zM241.3 383.4C256.3 399 282.4 416 320 416C357.6 416 383.7 399 398.7 383.4C407.9 373.8 423.1 373.5 432.6 382.7C442.1 391.9 442.5 407.1 433.3 416.6C411.2 439.6 373.3 464 320 464C266.7 464 228.8 439.6 206.7 416.6C197.5 407 197.8 391.8 207.4 382.7C217 373.6 232.2 373.8 241.3 383.4zM208 272C208 254.3 222.3 240 240 240C257.7 240 272 254.3 272 272C272 289.7 257.7 304 240 304C222.3 304 208 289.7 208 272zM400 240C417.7 240 432 254.3 432 272C432 289.7 417.7 304 400 304C382.3 304 368 289.7 368 272C368 254.3 382.3 240 400 240z" />
                            </svg>
                            အားပေးမှုကို ကျေးဇူးတင်ပါသည်
                        </td>
                        <td colspan="2" class="text-right font-bold">
                            သင့်ငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ number_format($grandTotalAllPages) }}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="border-0">
                            လက်မှတ်
                        </td>
                        <td colspan="2" class="text-right font-bold">
                            စရံငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ number_format($prepaid_amount ?? 0) }}
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="border-b"></td>
                        <td colspan="2" class="text-right font-bold">
                            ကျန်ငွေ
                        </td>
                        <td class="text-right font-bold">
                            {{ number_format($grandTotalAllPages - $prepaid_amount) }}
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
    @endif
</body>

</html>
