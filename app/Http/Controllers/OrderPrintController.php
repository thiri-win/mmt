<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Order;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\Browsershot\Browsershot;
use Spatie\LaravelPdf\Facades\Pdf;

class OrderPrintController extends Controller
{
    public function select(Request $request)
    {
        return Inertia::render('print/OrderPrintSelect');
    }

    public function print(Request $request)
    {
        $from = data_get(session('order_filters'), 'from');
        $to = data_get(session('order_filters'), 'to');
        $customerId = data_get(session('order_filters'), 'customer');
        $group_by_date = $request->boolean('group_by_date');
        $group_by_location = $request->boolean('group_by_location');
        $show_location = $request->boolean('show_location');
        $show_item = $request->boolean('show_item');
        $prepaid_amount = $request->prepaid_amount;

        $orders = Order::with(['customer', 'sellinfos.item'])->orderBy('date', 'asc');

        if ($from && $to) $orders->whereBetween('date', [$from, $to]);
        elseif ($from) $orders->whereDate('date', '>=', $from);
        elseif ($to) $orders->whereDate('date', '<=', $to);

        if ($customerId) $orders->where('customer_id', $customerId);

        $orderData = $orders->get();

        if ($group_by_date) {
            $orderData = $orders->get()->groupBy(function ($order) {
                return $order->date->format('Y-m-d');
            });
        }

        if ($group_by_location) {
            $orderData = $orders->get()->groupBy(function ($order) {
                return $order->location;
            });
        }

        $customer = Customer::find($customerId);
        $totalRows = 16;

        return Pdf::view('orders.customer-print', [

            'customer' => $customer,
            'date' => $orders->first()->date ?? '',
            'totalRows' => $totalRows,
            'orderData' => $orderData,

            'group_by_date' => $group_by_date,
            'group_by_location' => $group_by_location,
            'prepaid_amount' => $prepaid_amount,
            'show_location' => $show_location,
            'show_item' => $show_item,
        ])
            ->withBrowsershot(function ($browsershot) {
                $browsershot
                    ->setNodeBinary('/usr/bin/node')
                    ->setNpmBinary('/usr/bin/npm')
                    ->noSandbox()
                    ->setOption('args', [
                        '--disable-web-security',
                        '--allow-file-access-from-files'
                    ]);
            })
            ->paperSize(182, 257, 'mm')
            ->headerView('partials._header')
            ->margins(43, 12, 13, 5, 'mm')
            ->name('orders.pdf');
    }
}
