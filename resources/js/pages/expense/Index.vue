<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Link } from '@inertiajs/vue3';
import dayjs from 'dayjs';
import { route } from 'ziggy-js';

defineProps({
    expenses: Array,
});

const confirmDelete = (e) => {
    if (!confirm('ဖျက်မှာသေချာပါသလား။ ပြန်ယူ၍ မရနိုင်ပါ')) {
        e.preventDefault();
    }
};
</script>

<template>
    <AppLayout>
        <div class="container mx-auto p-5">
            <Link :href="route('expenses.create')" class="link"
                >+ အသစ်ထည့်ရန်</Link
            >
            <table class="my-table">
                <thead>
                    <tr>
                        <th>နေ့စွဲ</th>
                        <th>အကြောင်းအရာ</th>
                        <th>ပမာဏ</th>
                        <th>မှတ်ချက်</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="expense in expenses" :key="expense.id">
                        <td class="text-right">
                            {{ dayjs(expense.date).format('DD-MM-YYYY') }}
                        </td>
                        <td>{{ expense.title }}</td>
                        <td class="text-right">{{ expense.total.toLocaleString() }}</td>
                        <td>{{ expense.note }}</td>
                        <th>
                            <Link
                                :href="`expenses/${expense.id}/edit`"
                                class="btn-edit"
                                >ပြင်ရန်</Link
                            >
                            <Link
                                :href="`expenses/${expense.id}`"
                                method="delete"
                                :onBefore="($event) => confirmDelete(e)"
                                class="btn-delete"
                                >ဖျက်ရန်</Link
                            >
                        </th>
                    </tr>
                </tbody>
            </table>
        </div>
    </AppLayout>
</template>
