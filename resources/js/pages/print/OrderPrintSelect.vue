<script setup>
import AppLayout from '@/layouts/AppLayout.vue';
import { useForm } from '@inertiajs/vue3';
import { computed } from 'vue';
const form = useForm({
    group_by_date: false,
    group_by_location: false,
    show_location: false,
    show_item: false,
    prepaid_amount: 0,
});

// printUrl ကို အောက်ပါအတိုင်း ပြင်ပါ
const printUrl = computed(() => {
    const params = new URLSearchParams({
        group_by_date: form.group_by_date,
        group_by_location: form.group_by_location,
        show_location: form.show_location,
        show_item: form.show_item,
        prepaid_amount: form.prepaid_amount,
    }).toString();
    return `/orders/print?${params}`;
});
</script>
<template>
    <AppLayout>
        <div class="print-form">
            <div>
                <label for="group_by_date"
                    ><input
                        type="checkbox"
                        name="group_by_date"
                        id="group_by_date"
                        v-model="form.group_by_date"
                    />နေ့စွဲတခုချင်းစီကို ခေါက်ရေစုစုပေါင်း နဲ့ ပြမယ်
                </label>
            </div>
            <div>
                <label for="group_by_location"
                    ><input
                        type="checkbox"
                        name="group_by_location"
                        id="group_by_location"
                        v-model="form.group_by_location"
                    />လိပ်စာတခုချင်းကို တရွက်ချင်းစီထွက်ပါမယ်</label
                >
            </div>
            <div>
                <label for="show_location"
                    ><input
                        type="checkbox"
                        name="show_location"
                        id="show_location"
                        v-model="form.show_location"
                    />ပို့ဆောင်တဲ့လိပ်စာ ထည့်မယ်</label
                >
            </div>
            <div>
                <label for="show_item"
                    ><input
                        type="checkbox"
                        name="show_item"
                        id="show_item"
                        v-model="form.show_item"
                    />အမျိုးအစား ထည့်မယ်</label
                >
            </div>
            <div>
                <label for="prepaid_amount">စရံငွေ</label>
                <input
                    type="number"
                    name="prepaid_amount"
                    id="prepaid_amount"
                    v-model="form.prepaid_amount"
                />
            </div>
            <div>
                <a
                    :href="printUrl"
                    target="_blank"
                    class="rounded border px-3 py-1"
                    >Print</a
                >
            </div>
        </div>
    </AppLayout>
</template>
