<template>
  <div>
    <h4>Available Puzzles</h4>
    <div class="flex-container">
      <div v-for="puzzle in puzzles" class="puzzle">
        <div>
          <span>{{puzzle.image_url}}</span>
        </div>
        <div>
          <span class="">{{ puzzle.name }}</span>
        </div>
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
  created() {
    this.getAllPuzzles();
  },
}
</script>

<style scoped>
.flex-container {
  display: flex;
  flex-flow: column wrap;
}

.puzzle {
  margin-left: 0;
}
</style>