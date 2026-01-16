<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Orders</title>
    <style>
        body { font-family: 'Noto Sans Myanmar', sans-serif; font-size: 12px; }
        .container { padding: 16px; }
        .filters { margin-bottom: 12px; }
        .filters span { margin-right: 8px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #000; padding: 6px; text-align: left; }
        thead th { background: #eee; }
        .group-row td { background: #f5f5f5; font-weight: bold; }
    </style>
    </head>
<body>
    <div class="container">
        <div class="filters">
            @if(!empty($filters['from'])) <span>From: {{ $filters['from'] }}</span> @endif
            @if(!empty($filters['to'])) <span>To: {{ $filters['to'] }}</span> @endif
            @if(!empty($filters['customer'])) <span>Customer: {{ $filters['customer'] }}</span> @endif
            @if(!empty($filters['dealer'])) <span>Dealer: {{ $filters['dealer'] }}</span> @endif
        </div>
        <table>
            <thead>
                <tr>
                    <th>ဒိုင်</th>
                    <th>အမျိုးအစား</th>
                    <th>ပမာဏ</th>
                    <th>နှုန်း</th>
                    <th>မှာယူသူ</th>
                    <th>နေရာ</th>
                    <th>အမျိုးအစား</th>
                    <th>ပမာဏ</th>
                    <th>နှုန်း</th>
                    <th>ကားခ</th>
                    <th>ခေါက်ရေ</th>
                    <th>စုစုပေါင်း</th>
                    <th>note</th>
                </tr>
            </thead>
            <tbody>
                {{-- @foreach($groups as $group)
                    <tr class="group-row">
                        <td colspan="13">{{ $group['date'] }}</td>
                    </tr> --}}
                    @foreach($groups as $order)
                        <tr>
                            <td>
                                {{ $order->date }}
                            </td>
                            <td>
                                @foreach($order->buyinfos as $index => $info)
                                    {{ $info->dealer?->name }}@if($index < count($order->buyinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>
                                @foreach($order->buyinfos as $index => $info)
                                    {{ $info->item?->name }}@if($index < count($order->buyinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>
                                @foreach($order->buyinfos as $index => $info)
                                    {{ $info->buy_qty }}@if($index < count($order->buyinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>
                                @foreach($order->buyinfos as $index => $info)
                                    {{ $info->buy_price }}@if($index < count($order->buyinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>{{ $order->customer?->name }}</td>
                            <td>{{ $order->location }}</td>
                            <td>
                                @foreach($order->sellinfos as $index => $info)
                                    {{ $info->item?->name }}@if($index < count($order->sellinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>
                                @foreach($order->sellinfos as $index => $info)
                                    {{ $info->sell_qty }}@if($index < count($order->sellinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>
                                @foreach($order->sellinfos as $index => $info)
                                    {{ $info->sell_price }}@if($index < count($order->sellinfos) - 1) + @endif
                                @endforeach
                            </td>
                            <td>{{ $order->car_rent_cost }}</td>
                            <td>{{ $order->count }}</td>
                            <td>{{ $order->grand_total }}</td>
                            <td>{{ $order->note }}</td>
                        </tr>
                    @endforeach
                {{-- @endforeach --}}
            </tbody>
        </table>
    </div>
</body>
</html>
