<template>
  <div>
    <h4>This is the dashboard</h4>
  </div>
</template>

<script>
export default {
  methods: {

  },
  activated() {
    console.log('dashboard activated!');
    this.$emit('selectBarItem', 'dashboard');
  },
}
</script>

<style>
</style>