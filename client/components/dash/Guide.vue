<template>
  <div>
    <h4>Available Climbs</h4>
    <div v-for="puzzle in puzzles" class="columns">
      <div>
        <span>{{puzzle.image_url}}</span>
      </div>
      <div>
        <span class="">{{ puzzle.name }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  methods: {
    ...mapActions([
      'getAllPuzzles',
    ]),
  },
  computed: {
    ...mapGetters([
      'puzzles',
    ]),
  },
  mounted() {
    this.$emit('selectBarItem', 'guide');
    this.getAllPuzzles();
  },
  activated() {
    this.$emit('selectBarItem', 'guide');
  },
}
</script>

<style>
</style>