<template>
  <v-container>
    <v-row>
      <v-grid s12>
        <h4>Available Puzzles</h4>
        <div class="flex-container">
          <v-card v-for="puzzle in puzzles" class="puzzle col m4">
            <div class="card-image">
              <img :src="puzzle.image_url">
            </div>
            <div class="card-content">
              <span class="card-title">{{ puzzle.name }}</span>
            </div>
          </v-card>
        </div>
      </v-grid>
    </v-row>
  </v-container>
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