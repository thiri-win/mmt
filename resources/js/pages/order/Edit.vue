<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm } from '@inertiajs/vue3';
import TomSelect from 'tom-select';
import 'tom-select/dist/css/tom-select.css';
import { onMounted, nextTick, computed } from 'vue';

const props = defineProps({
    order: {
        type: Object,
        default: () => ({}),
    },
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
})

const form = useForm({
    date: new Date(props.order.date).toISOString().substring(0, 10),
    location: props.order.location,
    car_rent_cost: props.order.car_rent_cost,
    grand_total: props.order.grand_total,
    customer_id: props.order.customer_id,
    count: props.order.count,
    buyInfos: props.order.buyinfos,
    sellInfos: props.order.sellinfos,
})

const initTomSelect = () => {
    document.querySelectorAll('select').forEach((el) => {
        if (el.tomselect) return;
        new TomSelect(el, {
            create: true,
            sortField: {
                field: "text",
                direction: "asc"
            }
        });
    });
}

const addBuyItem = async () => {
    form.buyInfos.push({
        id: Math.random().toString(36).substring(2),
        dealer_id: '',
        item_id: '',
        buy_qty: '',
        buy_price: '',
    })
    await nextTick();
    initTomSelect();
}

const addSellItem = async () => {
    form.sellInfos.push({
        id: Math.random().toString(36).substring(2),
        item_id: '',
        sell_qty: '',
        sell_price: '',
    })
    await nextTick();
    initTomSelect();
}

const removeBuyItem = (item) => {
    form.buyInfos = form.buyInfos.filter(i => i.id != item.id)
}

const removeSellItem = (item) => {
    form.sellInfos = form.sellInfos.filter(i => i.id != item.id)
}

form.grand_total = computed(() => {
    return (form.sellInfos.reduce((total, sellItem) => {
        return total + (sellItem.sell_qty * sellItem.sell_price)
    }, 0) + form.car_rent_cost) * form.count;
})

const submit = () => {
    form.put(`/orders/${props.order.id}`, props.order.id)
}

onMounted(() => {
    initTomSelect();
});

</script>
<template>

    <Head title="စာရင်းပြင်ရန်" />
    <AppLayout>
        <div class="container mx-auto p-5">
            <h1 class="text-2xl font-bold mb-3">စာရင်းပြင်ရန်</h1>
            <form @submit.prevent="submit">
                <table>
                    <tr>
                        <td colspan="6">
                            <input type="date" id="date" name="date" v-model="form.date" />
                        </td>
                    </tr>
                    <tr v-for="(buyItem, index) in form.buyInfos" :key="buyItem.id">
                        <td>
                            <select :id="'dealer_id_' + index" placeholder="ဒိုင်" autocomplete="off" name="dealer_id" v-model="buyItem.dealer_id">
                                <option value="">ဒိုင်</option>
                                <option v-for="dealer in dealers" :value="dealer.id" :key="dealer.id">{{ dealer.name }}</option>
                            </select>
                        </td>
                        <td>
                            <select :id="'item_id_' + index" placeholder="အမျိုးအစား" autocomplete="off" name="item_id" v-model="buyItem.item_id">
                                <option value="">အမျိုးအစား</option>
                                <option v-for="item in items" :value="item.id" :key="item.id">{{ item.name }}</option>
                            </select>
                        </td>
                        <td>
                            <input type="number" name="buy_qty" :id="'buy_qty_' + index" step="0.01" placeholder="ဝယ် ပမာဏ" v-model="buyItem.buy_qty" />
                        </td>
                        <td>
                            <input type="number" name="buy_price" :id="'buy_price_' + index" step="0.01" placeholder="ဝယ် ဈေးနှုန်း" v-model="buyItem.buy_price" />
                        </td>
                        <td>
                            <span>{{ buyItem.buy_qty * buyItem.buy_price }}</span>
                        </td>
                        <td>
                            <button type="button" @click="removeBuyItem(buyItem)" class="text-nowrap">- REMOVE</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="button" @click="addBuyItem">+ ADD</button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td class="align-top">
                            <select id="customer_id" placeholder="မှာယူသူ" autocomplete="off" name="customer_id" v-model="form.customer_id">
                                <option value="">Select a person...</option>
                                <option v-for="customer in customers" :value="customer.id" :key="customer.id">{{ customer.name }}</option>
                            </select>
                        </td>
                        <td colspan="5">
                            <table>
                                <tr v-for="(sellItem, index) in form.sellInfos" :key="sellItem.id">
                                    <td>
                                        <select id="item_id" placeholder="အမျိုးအစား" autocomplete="off" name="item_id" v-model="sellItem.item_id" autofocus="
">
                                            <option value="">အမျိုးအစား</option>
                                            <option v-for="item in items" :value="item.id" :key="item.id">{{ item.name }}</option>
                                        </select>
                                    </td>
                                    <td>
                                        <input type="number" name="sell_qty" :id="'sell_qty_' + index" step="0.01" placeholder="ရောင်း ပမာဏ" v-model="sellItem.sell_qty" />
                                    </td>
                                    <td>
                                        <input type="number" name="sell_price" :id="'sell_price_' + index" step="0.01" placeholder="ရောင်း ဈေးနှုန်း" v-model="sellItem.sell_price" />
                                    </td>
                                    <td>
                                        <span>{{ sellItem.sell_qty * sellItem.sell_price }}</span>
                                    </td>
                                    <td>
                                        <button type="button" @click="removeSellItem(sellItem)">- REMOVE</button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <button type="button" @click="addSellItem">+ ADD</button>
                        </td>
                        <td colspan="5"></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input type="text" id="location" name="location" placeholder="ပို့ဆောင်ရန်လိပ်စာ" v-model="form.location" />
                        </td>
                        <td colspan="2">
                            <input type="number" id="car_rent_cost" name="car_rent_cost" placeholder="ကားခ" v-model="form.car_rent_cost" />
                        </td>
                        <td>
                            <input type="number" id="grand_total" name="grand_total" disabled placeholder="စုစုပေါင်း" v-model="form.grand_total" />
                        </td>
                        <td>
                            <input type="number" name="count" id="count" placeholder="ခေါက်ရေ" v-model="form.count">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit">Submit</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </AppLayout>
</template>
