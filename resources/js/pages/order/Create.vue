<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import TomSelect from 'tom-select';
import 'tom-select/dist/css/tom-select.css';
import { computed, nextTick, onMounted } from 'vue';

defineProps({
    items: {
        type: Array,
        default: () => [],
    },
    dealers: {
        type: Array,
        default: () => [],
    },
    customers: {
        type: Array,
        default: () => [],
    },
});

const form = useForm({
    date: new Date().toISOString().substring(0, 10),
    location: '',
    car_rent_cost: '',
    grand_total: '',
    customer_id: '',
    count: 1,
    buyItems: [
        {
            id: 1,
            dealer_id: '',
            item_id: '',
            buy_qty: '',
            buy_price: '',
        },
    ],
    sellItems: [
        {
            id: 1,
            item_id: '',
            sell_qty: '',
            sell_price: '',
        },
    ],
});

const initTomSelect = () => {
    document.querySelectorAll('select').forEach((el) => {
        if (el.tomselect) return;
        new TomSelect(el, {
            create: true,
            sortField: {
                field: 'text',
                direction: 'asc',
            },
        });
    });
};

const addBuyItem = async () => {
    const newId =
        form.buyItems.length > 0
            ? Math.max(...form.buyItems.map((item) => item.id)) + 1
            : 1;

    form.buyItems.push({
        id: newId,
        dealer_id: '',
        item_id: '',
        buy_qty: '',
        buy_price: '',
    });
    await nextTick();
    initTomSelect();
};

const addSellItem = async () => {
    const newId =
        form.sellItems.length > 0
            ? Math.max(...form.sellItems.map((item) => item.id)) + 1
            : 1;

    form.sellItems.push({
        id: newId,
        item_id: '',
        sell_qty: '',
        sell_price: '',
    });
    await nextTick();
    initTomSelect();
};

const removeBuyItem = (item) => {
    form.buyItems = form.buyItems.filter((i) => i.id != item.id);
};

const removeSellItem = (item) => {
    form.sellItems = form.sellItems.filter((i) => i.id != item.id);
};

form.grand_total = computed(() => {
    const total = (form.sellItems.reduce((total, sellItem) => {
            return total + sellItem.sell_qty * sellItem.sell_price;
        }, 0) + Number(form.car_rent_cost)) * Number(form.count)
    return parseFloat(total.toFixed());
});

const submit = () => {
    form.post('/orders');
};

onMounted(() => {
    initTomSelect();
});
</script>
<template>
    <Head title="စာရင်းအသစ်ထည့်ရန်" />
    <AppLayout>
        <div class="container mx-auto p-5">
            <h1 class="mb-3 text-2xl font-bold">စာရင်းအသစ်ထည့်ရန်</h1>
            <form @submit.prevent="submit">
                <table>
                    <tr>
                        <td colspan="6">
                            <input
                                type="date"
                                id="date"
                                name="date"
                                v-model="form.date"
                                autofocus
                                :class="
                                    form.errors['date'] ? 'border-red-300' : ''
                                "
                            />
                        </td>
                    </tr>
                    <tr>
                        <td><label>ဒိုင်</label></td>
                        <td><label>အမျိုးအစား</label></td>
                        <td><label>ပမာဏ</label></td>
                        <td><label>နှုန်း</label></td>
                        <td><label>စုစုပေါင်း</label></td>
                        <td></td>
                    </tr>
                    <tr
                        v-for="(buyItem, index) in form.buyItems"
                        :key="buyItem.id"
                    >
                        <td>
                            <select
                                :id="'dealer_id_' + index"
                                placeholder="ဒိုင်"
                                autocomplete="off"
                                name="dealer_id"
                                v-model="buyItem.dealer_id"
                                :class="
                                    form.errors[`buyItems.${index}.dealer_id`]
                                        ? 'border-red-300'
                                        : ''
                                "
                            >
                                <option value="">ဒိုင်</option>
                                <option
                                    v-for="dealer in dealers"
                                    :value="dealer.id"
                                    :key="dealer.id"
                                >
                                    {{ dealer.name }}
                                </option>
                            </select>
                        </td>
                        <td>
                            <select
                                :id="'item_id_' + index"
                                placeholder="အမျိုးအစား"
                                autocomplete="off"
                                name="item_id"
                                v-model="buyItem.item_id"
                                :class="
                                    form.errors[`buyItems.${index}.item_id`]
                                        ? 'border-red-300'
                                        : ''
                                "
                            >
                                <option value="">အမျိုးအစား</option>
                                <option
                                    v-for="item in items"
                                    :value="item.id"
                                    :key="item.id"
                                >
                                    {{ item.name }}
                                </option>
                            </select>
                        </td>
                        <td>
                            <input
                                type="number"
                                name="buy_qty"
                                :id="'buy_qty_' + index"
                                step="0.01"
                                placeholder="ဝယ် ပမာဏ"
                                v-model="buyItem.buy_qty"
                                :class="
                                    form.errors[`buyItems.${index}.buy_qty`]
                                        ? 'border-red-300'
                                        : ''
                                "
                            />
                        </td>
                        <td>
                            <input
                                type="number"
                                name="buy_price"
                                :id="'buy_price_' + index"
                                step="0.01"
                                placeholder="ဝယ် ဈေးနှုန်း"
                                v-model="buyItem.buy_price"
                                :class="
                                    form.errors[`buyItems.${index}.buy_price`]
                                        ? 'border-red-300'
                                        : ''
                                "
                            />
                        </td>
                        <td>
                            <span>{{
                                (buyItem.buy_qty * buyItem.buy_price).toFixed()
                            }}</span>
                        </td>
                        <td>
                            <button
                                type="button"
                                @click="removeBuyItem(buyItem)"
                                class="text-nowrap"
                            >
                                - REMOVE
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" @click="addBuyItem">
                                + ADD
                            </button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td><label>မှာယူသူ</label></td>
                        <td><label>အမျိုးအစား</label></td>
                        <td><label>ပမာဏ</label></td>
                        <td><label>နှုန်း</label></td>
                        <td><label>စုစုပေါင်း</label></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="align-top">
                            <select
                                id="customer_id"
                                placeholder="မှာယူသူ"
                                autocomplete="off"
                                name="customer_id"
                                v-model="form.customer_id"
                                :class="
                                    form.errors.customer_id
                                        ? 'border-red-300'
                                        : ''
                                "
                            >
                                <option value="">Select a person...</option>
                                <option
                                    v-for="customer in customers"
                                    :value="customer.id"
                                    :key="customer.id"
                                >
                                    {{ customer.name }}
                                </option>
                            </select>
                        </td>
                        <td colspan="5">
                            <table>
                                <tr
                                    v-for="(sellItem, index) in form.sellItems"
                                    :key="sellItem.id"
                                >
                                    <td>
                                        <select
                                            id="item_id"
                                            placeholder="အမျိုးအစား"
                                            autocomplete="off"
                                            name="item_id"
                                            v-model="sellItem.item_id"
                                            :class="
                                                form.errors[
                                                    `sellItems.${index}.item_id`
                                                ]
                                                    ? 'border-red-300'
                                                    : ''
                                            "
                                        >
                                            <option value="">အမျိုးအစား</option>
                                            <option
                                                v-for="item in items"
                                                :value="item.id"
                                                :key="item.id"
                                            >
                                                {{ item.name }}
                                            </option>
                                        </select>
                                    </td>
                                    <td>
                                        <input
                                            type="number"
                                            name="sell_qty"
                                            :id="'sell_qty_' + index"
                                            step="0.01"
                                            placeholder="ရောင်း ပမာဏ"
                                            v-model="sellItem.sell_qty"
                                            :class="
                                                form.errors[
                                                    `sellItems.${index}.sell_qty`
                                                ]
                                                    ? 'border-red-300'
                                                    : ''
                                            "
                                        />
                                    </td>
                                    <td>
                                        <input
                                            type="number"
                                            name="sell_price"
                                            :id="'sell_price_' + index"
                                            step="0.01"
                                            placeholder="ရောင်း ဈေးနှုန်း"
                                            v-model="sellItem.sell_price"
                                            :class="
                                                form.errors[
                                                    `sellItems.${index}.sell_price`
                                                ]
                                                    ? 'border-red-300'
                                                    : ''
                                            "
                                        />
                                    </td>
                                    <td>
                                        <span>{{ (sellItem.sell_qty * sellItem.sell_price).toFixed() }}</span>
                                    </td>
                                    <td>
                                        <button
                                            type="button"
                                            @click="removeSellItem(sellItem)"
                                        >
                                            - REMOVE
                                        </button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <button type="button" @click="addSellItem">
                                + ADD
                            </button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="2"><label>ပို့ဆောင်ရန်လိပ်စာ</label></td>
                        <td><label>ကားခ</label></td>
                        <td><label>ခေါက်ရေ</label></td>
                        <td><label>စုစုပေါင်း</label></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input
                                type="text"
                                id="location"
                                name="location"
                                placeholder="ပို့ဆောင်ရန်လိပ်စာ"
                                v-model="form.location"
                                :class="
                                    form.errors.location ? 'border-red-300' : ''
                                "
                            />
                        </td>
                        <td>
                            <input
                                type="number"
                                id="car_rent_cost"
                                name="car_rent_cost"
                                placeholder="ကားခ"
                                v-model="form.car_rent_cost"
                                :class="
                                    form.errors.car_rent_cost
                                        ? 'border-red-300'
                                        : ''
                                "
                            />
                        </td>
                        <td>
                            <input
                                type="number"
                                name="count"
                                id="count"
                                placeholder="ခေါက်ရေ"
                                v-model="form.count"
                                :class="
                                    form.errors.count ? 'border-red-300' : ''
                                "
                            />
                        </td>
                        <td>
                            <input
                                type="number"
                                id="grand_total"
                                name="grand_total"
                                disabled
                                placeholder="စုစုပေါင်း"
                                v-model="form.grand_total"
                                :class="
                                    form.errors.grand_total
                                        ? 'border-red-300'
                                        : ''
                                "
                            />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="btn-submit">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </AppLayout>
</template>
