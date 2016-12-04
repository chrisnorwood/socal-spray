<template>
  <div>
    <div>
      <div>
        <h4>Available Puzzles</h4>
        <div class="flex-container">
          <div v-for="puzzle in puzzles" class="puzzle">
            <div>
              <img :src="puzzle.image_url">
            </div>
            <div>
              <span class="">{{ puzzle.name }}</span>
            </div>
          </v-card>
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
  flex-flow: row wrap;
}

.puzzle {
  margin-left: 0;
}
</style>