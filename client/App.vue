<template>
  <div>
    <ss-header></ss-header>
    <router-view></router-view>
  </div>
</template>

<script>
import Header from './components/layout/Header.vue'

export default {
  name: 'app',
  components: {
    ssHeader: Header,
  },
}
</script>

<style>
</style>
