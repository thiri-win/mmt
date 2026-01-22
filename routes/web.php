<?php

use App\Http\Controllers\OrderController;
use Illuminate\Support\Facades\Route;
use Inertia\Inertia;
use Laravel\Fortify\Features;
use App\Models\Order;

Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canRegister' => Features::enabled(Features::registration()),
    ]);
})->name('home');

Route::get('dashboard', function () {
    // 1. Orders processing
    $monthlyReport = Order::with(['buyinfos', 'sellinfos'])->get()
        ->groupBy(function ($order) {
            // "2024-01" format က sorting လုပ်ရတာ ပိုမှန်ကန်ပါတယ်
            return $order->date->format('Y-m');
        })->map(function ($group) {
            $buyTotal = $group->sum(fn($o) => $o->buyinfos->sum(fn($i) => $i->buy_qty * $i->buy_price));
            $sellTotal = $group->sum(fn($o) => $o->sellinfos->sum(fn($i) => $i->sell_qty * $i->sell_price));

            return [
                'buyTotal' => $buyTotal,
                'sellTotal' => $sellTotal,
                'profit' => $sellTotal - $buyTotal,
            ];
        });

    // 2. Expenses processing
    $expenses = \App\Models\Expense::all()
        ->groupBy(function ($expense) {
            return $expense->date->format('Y-m');
        })->map(fn($group) => ['sum' => $group->sum('total')]);

    // 3. Merge and Sort
    $allMonths = $monthlyReport->keys()->merge($expenses->keys())->unique();

    $finalReport = $allMonths->mapWithKeys(function ($month) use ($monthlyReport, $expenses) {
        $reportData = $monthlyReport->get($month, ['buyTotal' => 0, 'sellTotal' => 0, 'profit' => 0]);
        $expenseSum = $expenses->get($month)['sum'] ?? 0;

        return [
            $month => [
                'month' => \Carbon\Carbon::parse($month)->format('Y-m'), // UI အတွက် "01-2024" ပြန်ပြောင်း
                'buyTotal' => $reportData['buyTotal'],
                'sellTotal' => $reportData['sellTotal'],
                'profit' => $reportData['profit'],
                'expense' => $expenseSum,
                'netProfit' => $reportData['profit'] - $expenseSum
            ]
        ];
    })->sortKeysDesc(); // Y-m format ဖြစ်တဲ့အတွက် sorting က အမြဲမှန်နေပါလိမ့်မယ်

    return Inertia::render('Dashboard', [
        'reports' => array_values($finalReport->toArray()) // Index တွေရှင်းသွားအောင် array_values သုံးပေးပါ
    ]);
})->middleware(['auth', 'verified'])->name('dashboard');

require __DIR__ . '/settings.php';

Route::get('orders/print', [OrderController::class, 'print'])->middleware('auth')->name('orders.print');
Route::resource("orders", OrderController::class)->middleware('auth');
Route::resource('expenses', \App\Http\Controllers\ExpenseController::class)->middleware('auth');

Route::get("/backup-database", function () {
    $dbName = config('database.connections.mysql.database');
    $username = config('database.connections.mysql.username');
    $password = config('database.connections.mysql.password');
    $host = config('database.connections.mysql.host');

    $filename = 'backup-' . date('Y-m-d-His') . '.sql';
    return response()->streamDownload(function () use ($dbName, $username, $password, $host) {
        $command = "mysqldump --user={$username} --password={$password} --host={$host} --single-transaction --quick {$dbName}";
        passthru($command);
    }, $filename);
})->middleware('auth')->name('backup-database');
