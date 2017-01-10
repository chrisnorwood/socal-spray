<template>
  <div>
    <h4>Available Climbs</h4>
    <div v-for="climb in climbs" class="columns">
      <div>
        <span>{{climb.image_url}}</span>
      </div>
      <div>
        <span class="">{{ climb.name }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  methods: {
    ...mapActions([
      'getAllClimbs',
    ]),
  },
  computed: {
    ...mapGetters([
      'climbs',
    ]),
  },
  mounted() {
    this.$emit('selectBarItem', 'guide');
    this.getAllClimbs();
  },
  activated() {
    this.$emit('selectBarItem', 'guide');
  },
}
</script>

<style>
</style>