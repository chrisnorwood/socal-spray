<template>
  <div>
    <div class="area-nav">
      <md-list v-for="area in areas">
        <md-list-item>
          <span>{{area.attributes.name}}</span>
        </md-list-item>
      </md-list>
    </div>

    <div class="dynamic-display">
      This would be the climb display
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