<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { dashboard } from '@/routes';
import { type BreadcrumbItem } from '@/types';
import { Head } from '@inertiajs/vue3';
import dayjs from 'dayjs';
import { DownloadIcon } from 'lucide-vue-next';

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Dashboard',
        href: dashboard().url,
    },
];
defineProps({
    reports: Array,
});
</script>

<template>
    <Head title="Dashboard" />
    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="container mx-auto p-5">
            <a href="/backup-database" class="link">
                <DownloadIcon class="inline-block" />
                DB Backup
            </a>
            <table class="my-table">
                <thead>
                    <tr>
                        <th>Date</th>
                        <th>ပစ္စည်းဝယ်</th>
                        <th>ရငွေ</th>
                        <th>အခြားကုန်ကျစရိတ်များ</th>
                        <th>အမြတ်ငွေ</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="(report, index) in reports" :key="index">
                        <td class="text-right">
                            {{ dayjs(report.month).format('MMM - YYYY') }}
                        </td>
                        <td class="text-right">
                            {{ Math.round(report.buyTotal).toLocaleString() }}
                        </td>
                        <td class="text-right">
                            {{ Math.round(report.sellTotal).toLocaleString() }}
                        </td>
                        <td class="text-right">
                            {{ Math.round(report.expense).toLocaleString() }}
                        </td>
                        <td class="text-right">
                            {{ Math.round(report.netProfit).toLocaleString() }}
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </AppLayout>
</template>
