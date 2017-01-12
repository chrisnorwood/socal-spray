<template>
  <div>
    <h4>This is the dashboard</h4>
  </div>
</template>

<script>
export default {
  methods: {

  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$emit('selectBarItem', 'dashboard');
    })
  },
}
</script>

<style>
</style>