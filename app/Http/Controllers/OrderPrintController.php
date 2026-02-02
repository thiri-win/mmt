<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Order;
use Illuminate\Http\Request;
use Spatie\LaravelPdf\Facades\Pdf;

class OrderPrintController extends Controller
{
    public function print(Request $request)
    {
        $groups = Order::with(['customer', 'buyinfos.item', 'buyinfos.dealer', 'sellinfos.item'])
            ->orderBy('date', 'asc');

        if ($request->from && $request->to) {
            $groups->whereBetween('date', [$request->from, $request->to]);
        } elseif ($request->from) {
            $groups->whereDate('date', '>=', $request->from);
        } elseif ($request->to) {
            $groups->whereDate('date', '<=', $request->to);
        }

        if ($request->customer) {
            $groups->where('customer_id', $request->customer);
        }

        if ($request->dealer) {
            $groups->whereHas('buyinfos', function ($q) use ($request) {
                $q->where('dealer_id', $request->dealer);
            });
        }

        $customer = Customer::find($request->customer);
        $totalRows = 16;
        $totalChunks = $groups->get()->count();

        return Pdf::view('orders.customer-print', [
            'groups' => $groups->get(),
            'customer' => $customer,
            'date' => $groups->first()->date ?? '',
            'totalRows' => $totalRows,
            'totalChunks' => $totalChunks,
        ])
            ->paperSize(182, 257, 'mm')
            ->headerView('partials._header')
            ->margins(43, 12, 13, 5, 'mm')
            ->withBrowsershot(function ($browsershot) {
                $browsershot->setChromePath(env('BROWSER_PATH'))->noSandbox();
            })
            ->name('orders.pdf');
    }
}
