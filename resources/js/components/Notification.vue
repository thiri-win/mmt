<script setup lang="ts">
import { usePage } from '@inertiajs/vue3';
import { computed, ref, watch } from 'vue';

const page = usePage();
const flash = computed(() => page.props.flash);
const showFlash = ref(false);

watch(flash, (newFlash) => {
    if (newFlash) {
        if (newFlash.success || newFlash.error) {
            showFlash.value = true;
            setTimeout(() => {
                showFlash.value = false;
            }, 5000);
        }
    }
}, { deep: true, immediate: true });
</script>

<template>
    <div v-if="showFlash && flash" class="absolute top-15 left-1/2 -translate-x-1/2 min-w-1/3">
        <div v-if="flash.success" class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative mb-4 text-center" role="alert">
            {{ flash.success }}
        </div>
        <div v-if="flash.error" class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative mb-4 text-center" role="alert">
            {{ flash.error }}
        </div>
    </div>
</template>
