<?php

namespace App\Http\Controllers;

use App\Models\Customer;
use App\Models\Dealer;
use App\Models\Item;
use App\Models\Order;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Spatie\LaravelPdf\Facades\Pdf;

use function PHPUnit\Framework\isNumeric;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $groups = $this->getFilteredOrders($request)->get()
            ->groupBy(function ($order) {
                return \Carbon\Carbon::parse($order->date)->toDateString();
            })
            ->map(function ($orders, $date) {
                return [
                    'date' => $date,
                    'orders' => $orders->values(),
                ];
            })
            ->values();
        return Inertia::render('order/Index', [
            'groups' => $groups,
            'customers' => Customer::all(),
            'dealers' => Dealer::all(),
            'filters' => $request->only(['from', 'to', 'customer', 'dealer']),
        ]);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return Inertia::render('order/Create', [
            'items' => Item::all(),
            'dealers' => Dealer::all(),
            'customers' => Customer::all()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'date' => 'required|date',
            'location' => 'required|string',
            'car_rent_cost' => 'required|numeric',
            'grand_total' => 'required|numeric',
            'customer_id' => 'required',
            'count' => 'required',

            'buyItems' => 'required|array',
            'buyItems.*.dealer_id' => 'required',
            'buyItems.*.item_id' => 'required',
            'buyItems.*.buy_qty' => 'required',
            'buyItems.*.buy_price' => 'required',

            'sellItems' => 'required|array',
            'sellItems.*.item_id' => 'required',
            'sellItems.*.sell_qty' => 'required',
            'sellItems.*.sell_price' => 'required',
        ]);

        if (!is_numeric($validatedData['customer_id'])) {
            $validatedData['customer_id'] = Customer::firstOrCreate(['name' => $validatedData['customer_id']])->id;
        }

        foreach ($validatedData['buyItems'] as &$buyItem) {
            $dealerId = $buyItem['dealer_id'];
            $itemId = $buyItem['item_id'];
            if (!is_numeric($dealerId)) {
                $newDealer = Dealer::firstOrCreate(['name' => $dealerId]);
                $buyItem['dealer_id'] = $newDealer->id;
            }
            if (!is_numeric($itemId)) {
                $newItem = Item::firstOrCreate(['name' => $itemId]);
                $buyItem['item_id'] = $newItem->id;
            }
        }

        foreach ($validatedData['sellItems'] as &$sellItem) {
            $itemId = $sellItem['item_id'];
            if (!is_numeric($itemId)) {
                $newItem = Item::firstOrCreate(['name' => $itemId]);
                $sellItem['item_id'] = $newItem->id;
            }
        }

        $order = Order::create($validatedData);
        $order->buyinfos()->createMany($validatedData['buyItems']);
        $order->sellinfos()->createMany($validatedData['sellItems']);

        return redirect()->route('orders.index');
    }

    /**
     * Display the specified resource.
     */
    public function show(Order $order)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Order $order)
    {
        return Inertia::render('order/Edit', [
            'order' => $order->load(['buyinfos', 'sellinfos']),
            'items' => Item::all(),
            'dealers' => Dealer::all(),
            'customers' => Customer::all()
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Order $order)
    {
        $validatedData = $request->validate([
            'date' => 'required|date',
            'location' => 'required|string',
            'car_rent_cost' => 'required|numeric',
            'grand_total' => 'required|numeric',
            'customer_id' => 'required',
            'count' => 'required',

            'buyItems' => 'required|array',
            'buyItems.*.id' => 'sometimes',
            'buyItems.*.dealer_id' => 'required',
            'buyItems.*.item_id' => 'required',
            'buyItems.*.buy_qty' => 'required',
            'buyItems.*.buy_price' => 'required',

            'sellItems' => 'required|array',
            'sellItems.*.id' => 'sometimes',
            'sellItems.*.item_id' => 'required',
            'sellItems.*.sell_qty' => 'required',
            'sellItems.*.sell_price' => 'required',
        ]);

        if (!is_numeric($validatedData['customer_id'])) {
            $validatedData['customer_id'] = Customer::firstOrCreate(['name' => $validatedData['customer_id']])->id;
        }

        foreach ($validatedData['buyItems'] as &$buyItem) {
            $dealerId = $buyItem['dealer_id'];
            $itemId = $buyItem['item_id'];
            if (!is_numeric($dealerId)) {
                $newDealer = Dealer::firstOrCreate(['name' => $dealerId]);
                $buyItem['dealer_id'] = $newDealer->id;
            }
            if (!is_numeric($itemId)) {
                $newItem = Item::firstOrCreate(['name' => $itemId]);
                $buyItem['item_id'] = $newItem->id;
            }
        }

        foreach ($validatedData['sellItems'] as &$sellItem) {
            $itemId = $sellItem['item_id'];
            if (!is_numeric($itemId)) {
                $newItem = Item::firstOrCreate(['name' => $itemId]);
                $sellItem['item_id'] = $newItem->id;
            }
        }

        $order->update($validatedData);

        $incomingBuyItems = collect($validatedData['buyItems'])
            ->pluck('id')
            ->filter(fn($id) => is_numeric($id) && $id > 0)
            ->map(fn($id) => (int) $id)
            ->all();;
        $order->buyinfos()->whereNotIn('id', $incomingBuyItems)->delete();
        foreach ($validatedData['buyItems'] as $item) {
            if (!is_numeric($item['id'])) {
                $order->buyinfos()->create($item);
            } else {
                $order->buyinfos()->find($item['id'])->update($item);
            }
        }

        $incomingSellItems = collect($validatedData['sellItems'])
            ->pluck('id')
            ->filter(fn($id) => is_numeric($id) && $id > 0)
            ->map(fn($id) => (int) $id)
            ->all();;
        $order->sellinfos()->whereNotIn('id', $incomingSellItems)->delete();
        foreach ($validatedData['sellItems'] as $item) {
            if (!is_numeric($item['id'])) {
                $order->sellinfos()->create($item);
            } else {
                $order->sellinfos()->find($item['id'])->update($item);
            }
        }

        return redirect()->route('orders.index');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        $order->buyinfos()->delete();
        $order->sellinfos()->delete();
        $order->delete();
        return redirect()->route('orders.index');
    }

    private function getFilteredOrders(Request $request)
    {
        $query = Order::with(['customer', 'buyinfos.item', 'buyinfos.dealer', 'sellinfos.item'])
            ->orderBy('date', 'desc');

        if ($request->from && $request->to) {
            $query->whereBetween('date', [$request->from, $request->to]);
        } elseif ($request->from) {
            $query->whereDate('date', '>=', $request->from);
        } elseif ($request->to) {
            $query->whereDate('date', '<=', $request->to);
        }

        if ($request->customer) {
            $query->where('customer_id', $request->customer);
        }

        if ($request->dealer) {
            $query->whereHas('buyinfos', function ($q) use ($request) {
                $q->where('dealer_id', $request->dealer);
            });
        }

        return $query;
    }

    public function print(Request $request)
    {
        $groups = $this->getFilteredOrders($request);
        $customer = Customer::find($request->customer);

        return Pdf::view('orders.customer-print', ['groups' => $groups->get()])
            ->format('a5')
            ->headerView('partials._header', ['customer' => $customer])
            ->footerView('partials._footer')
            ->margins(45, 5, 30, 5)
            ->name('orders.pdf');
    }
}
