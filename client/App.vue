<template>
  <div>
    <ww-header></ww-header>
    <ww-puzzles></ww-puzzles>
  </div>
</template>

<script>
import Header from './components/Header.vue'
import Puzzles from './components/Puzzles.vue'

export default {
  name: 'app',
  components: {
    wwHeader: Header,
    wwPuzzles: Puzzles,
  },
}
</script>

<style>
</style>
