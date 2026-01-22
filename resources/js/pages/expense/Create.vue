<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { useForm } from '@inertiajs/vue3';
import { route } from 'ziggy-js';

const props = defineProps({
    expense: Object,
});
const form = useForm({
    date: new Date().toISOString().substring(0, 10),
    title: props.expense.title || '',
    total: props.expense.total || '',
    note: props.expense.note || '',
});
const submit = () => {
    if (props.expense.id) {
        form.put(route('expenses.update', props.expense.id));
    } else {
        form.post(route('expenses.store'));
    }
};
</script>

<template>
    <AppLayout>
        <div class="container mx-auto p-5">
            <h1>
                {{ props.expense.id ? 'စာရင်းပြင်ရန်' : 'အခြားစာရင်းထည့်ရန်' }}
            </h1>
            <form @submit.prevent="submit">
                <div>
                    <label for="date">နေ့စွဲ:</label>
                    <input
                        type="date"
                        name="date"
                        id="date"
                        v-model="form.date"
                    />
                    <p class="error" v-if="form.errors.date">
                        {{ form.errors.date }}
                    </p>
                </div>
                <div>
                    <label for="title">အကြောင်းအရာ:</label>
                    <input
                        type="text"
                        name="title"
                        id="title"
                        v-model="form.title"
                        placeholder="Title"
                    />
                    <p class="error" v-if="form.errors.title">
                        {{ form.errors.title }}
                    </p>
                </div>
                <div>
                    <label for="total">ပမာဏ:</label>
                    <input
                        type="number"
                        name="total"
                        id="total"
                        v-model="form.total"
                        placeholder="Total"
                    />
                    <p class="error" v-if="form.errors.total">
                        {{ form.errors.total }}
                    </p>
                </div>
                <div>
                    <label for="note">မှတ်ချက်:</label>
                    <input
                        type="text"
                        name="note"
                        id="note"
                        v-model="form.note"
                        placeholder="Note"
                    />
                    <p class="error" v-if="form.errors.note">
                        {{ form.errors.note }}
                    </p>
                </div>
                <div>
                    <input
                        type="submit"
                        :value="props.expense.id ? 'Update' : 'Submit'"
                        :class="props.expense.id ? 'btn-edit' : 'btn-submit'"
                    />
                </div>
            </form>
        </div>
    </AppLayout>
</template>
