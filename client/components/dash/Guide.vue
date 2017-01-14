<template>
  <div>
    <h4>Available Areas</h4>
    <div v-for="area in areas" class="columns">
      <div>
        <span>{{area.attributes.name}}</span>
      </div>
      <div>
        <span class="">{{ area.attributes.description }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  methods: {
    ...mapActions([
      'getInitialAreas',
    ]),
  },
  computed: {
    ...mapGetters([
      'areas',
    ]),
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$emit('selectBarItem', 'guide');
    })
  },
  mounted() {
    this.getInitialAreas();
  },
}
</script>

<style>
</style>