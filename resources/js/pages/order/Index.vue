<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, useForm } from '@inertiajs/vue3';
import { computed } from 'vue';
import { route } from 'ziggy-js';
const props = defineProps({
    groups: {
        type: Array,
        default: () => [],
    },
    filters: {
        type: Object,
        default: () => ({ from: '', to: '', customer: '', dealer: '' }),
    },
    customers: {
        type: Array,
        default: () => [],
    },
    dealers: {
        type: Array,
        default: () => [],
    },
});

const form = useForm({
    from: props.filters?.from || '',
    to: props.filters?.to || '',
    customer: props.filters?.customer || '',
    dealer: props.filters?.dealer || '',
});

const applyFilter = () => {
    form.get('/orders', {
        preserveScroll: true,
        preserveState: true,
        replace: true,
    });
};

const clearFilter = () => {
    form.from = '';
    form.to = '';
    form.customer = '';
    form.dealer = '';
    form.get('/orders', {
        preserveScroll: true,
        preserveState: true,
        replace: true,
    });
};

// printUrl ကို အောက်ပါအတိုင်း ပြင်ပါ
const printUrl = computed(() => {
    const params = new URLSearchParams({
        from: form.from,
        to: form.to,
        customer: form.customer,
        dealer: form.dealer,
    }).toString();

    return `/orders/print?${params}`;
});

const confirmDelete = (e) => {
    if (!confirm('Are you sure you want to delete this order?')) {
        e.preventDefault();
    }
};
</script>
<template>
    <AppLayout>
        <Head title="စာရင်းများကြည့်ရန်"></Head>
        <div class="container mx-auto p-5">
            <Link :href="route('orders.create')" class="link">+ စာရင်းအသစ်ရေးရန်</Link>
            <div class="mb-4 flex flex-wrap items-end gap-3">
                <div>
                    <label class="mb-1 block text-sm font-medium" for="from"
                        >From</label
                    >
                    <input
                        id="from"
                        type="date"
                        v-model="form.from"
                        class="rounded border px-2 py-1"
                    />
                </div>
                <div>
                    <label class="mb-1 block text-sm font-medium" for="to"
                        >To</label
                    >
                    <input
                        id="to"
                        type="date"
                        v-model="form.to"
                        class="rounded border px-2 py-1"
                    />
                </div>
                <div>
                    <label class="mb-1 block text-sm font-medium" for="customer"
                        >မှာယူသူ</label
                    >
                    <select
                        id="customer"
                        v-model="form.customer"
                        class="block rounded border px-2 py-1"
                    >
                        <option value="">All</option>
                        <option
                            v-for="c in customers"
                            :key="c.id"
                            :value="c.id"
                        >
                            {{ c.name }}
                        </option>
                    </select>
                </div>
                <div>
                    <label class="mb-1 block text-sm font-medium" for="dealer"
                        >ဒိုင်</label
                    >
                    <select
                        id="dealer"
                        v-model="form.dealer"
                        class="block rounded border px-2 py-1"
                    >
                        <option value="">All</option>
                        <option v-for="d in dealers" :key="d.id" :value="d.id">
                            {{ d.name }}
                        </option>
                    </select>
                </div>
                <button
                    type="button"
                    class="rounded border px-3 py-1"
                    @click="applyFilter"
                >
                    Search
                </button>
                <button
                    type="button"
                    class="rounded border px-3 py-1"
                    @click="clearFilter"
                >
                    Clear
                </button>
                <a
                    :href="printUrl"
                    target="_blank"
                    class="rounded border px-3 py-1"
                    >Print</a
                >
            </div>
            <table class="my-table w-full! border">
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
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <template v-for="group in groups" :key="group.date">
                        <tr class="bg-gray-100/60 dark:bg-gray-100/10">
                            <td colspan="14" class="font-semibold">
                                {{ group.date }}
                            </td>
                        </tr>
                        <tr v-for="order in group.orders" :key="order.id">
                            <td>
                                <div
                                    v-for="(info, index) in order.buyinfos"
                                    :key="info.id"
                                >
                                    {{ info.dealer?.name }}
                                    <span
                                        v-if="index < order.buyinfos.length - 1"
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div
                                    v-for="(info, index) in order.buyinfos"
                                    :key="info.id"
                                >
                                    {{ info.item?.name }}
                                    <span
                                        v-if="index < order.buyinfos.length - 1"
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div
                                    v-for="(info, index) in order.buyinfos"
                                    :key="info.id"
                                >
                                    {{ info.buy_qty }}
                                    <span
                                        v-if="index < order.buyinfos.length - 1"
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div
                                    v-for="(info, index) in order.buyinfos"
                                    :key="info.id"
                                >
                                    {{
                                        Number(info.buy_price).toLocaleString()
                                    }}
                                    <span
                                        v-if="index < order.buyinfos.length - 1"
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>{{ order.customer?.name }}</td>
                            <td>{{ order.location }}</td>
                            <td>
                                <div
                                    v-for="(info, index) in order.sellinfos"
                                    :key="info.id"
                                >
                                    {{ info.item?.name }}
                                    <span
                                        v-if="
                                            index < order.sellinfos.length - 1
                                        "
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div
                                    v-for="(info, index) in order.sellinfos"
                                    :key="info.id"
                                >
                                    {{ info.sell_qty }}
                                    <span
                                        v-if="
                                            index < order.sellinfos.length - 1
                                        "
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>
                                <div
                                    v-for="(info, index) in order.sellinfos"
                                    :key="info.id"
                                >
                                    {{
                                        Number(info.sell_price).toLocaleString()
                                    }}
                                    <span
                                        v-if="
                                            index < order.sellinfos.length - 1
                                        "
                                    >
                                        +
                                    </span>
                                </div>
                            </td>
                            <td>{{ order.car_rent_cost.toLocaleString() }}</td>
                            <td>{{ order.count }}</td>
                            <td>{{ order.grand_total.toLocaleString() }}</td>
                            <td>{{ order.note }}</td>
                            <td class="text-center">
                                <Link
                                    :href="`/orders/${order.id}/edit`"
                                    class="btn-edit"
                                    >ပြင်ရန်</Link
                                >
                                <Link
                                    :href="`/orders/${order.id}`"
                                    method="delete"
                                    class="btn-delete"
                                    :onBefore="() => confirmDelete($event)"
                                    >ဖျက်ရန်</Link
                                >
                            </td>
                        </tr>
                    </template>
                </tbody>
            </table>
        </div>
    </AppLayout>
</template>
