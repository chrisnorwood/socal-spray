<template>
  <div>
    <div class="area-nav">
      <md-whiteframe md-elevation="5">
        <md-list class="md-dense">
          
          <md-list-item v-if="selectedArea && areaHasParent">
            <router-link exact :to="selectedParentRoute">
              <md-icon>reply</md-icon>
              <span>Back</span>
            </router-link>
          </md-list-item>
          
          <md-list-item v-if="areas && selectedArea">
            <md-icon>panorama</md-icon>
            <span class="underline">
              Areas in
              <span class="parent-area">
                {{ selectedArea.attributes.name }}:
              </span>
            </span>
            
          </md-list-item>
          
          <md-list-item class="md-inset" v-for="area in areas">
            <router-link :to="{ name: 'area' , params: { area_id: area.attributes.slug } }">
              {{area.attributes.name}}
            </router-link>

          </md-list-item>

          <md-list-item v-if="selectedArea">
            <md-icon>panorama</md-icon>
            <span class="underline">
              Climbs in
              <span class="parent-area">
                {{ selectedArea.attributes.name }}:
              </span>
            </span>
          </md-list-item>

        </md-list>
      </md-whiteframe>
    </div>

    <transition
      enter-active-class="animated fadeIn"
      leave-active-class="animated fadeOut"
      mode="out-in">
      <div class="dynamic-display" v-if="selectedArea" :key="$route.params.area_id" id="guide-display">
        <md-whiteframe md-elevation="7" class="guide-container">
          <div class="row">
            <md-card class="area-card">
              <md-card-media-cover md-solid>
                <md-card-media md-ratio="16:9">
                  <img src="http://placeimg.com/640/480/nature">
                </md-card-media>

                <md-card-area>
                  <md-card-header>
                    <div class="md-title">{{ selectedArea.attributes.name }}</div>
                    <div class="md-subheading">Rock Climbing</div>
                  </md-card-header>

                  <md-card-actions>
                    <md-button>Photos</md-button>
                  </md-card-actions>
                </md-card-area>
              </md-card-media-cover>
            </md-card>
          </div>

          <div class="row">
            {{ selectedArea }}
          </div>
        </md-whiteframe>
      </div>
    </transition>
  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';

export default {
  methods: {
    ...mapActions([
      'getInitialAreas',
      'selectArea',
    ]),
    selectAreaFromRoute() {
      if (this.isAreaSelected) {
        this.selectArea(this.$route.params);
      } else {
        this.selectArea({ area_id: 'world' });
      }
    },
  },
  computed: {
    ...mapGetters([
      'areas',
      'selectedArea'
    ]),
    isAreaSelected() {
      return !!this.$route.params.area_id;
    },
    areaHasParent() {
      return !!this.selectedArea.relationships.parent.data;
    },
    selectedParentRoute() {
      let parentAreaID = this.selectedArea.relationships.parent.data.id;

      if (parentAreaID == 1) {
        return { name: 'guide' };
      } else {
        return { name: 'area', params: { area_id: this.selectedArea.relationships.parent.data.slug } };
      }
    }
  },
  mounted() {
    this.selectAreaFromRoute();
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$emit('selectBarItem', 'guide');
    })
  },
  watch: {
    $route () {
      console.log(this.$route)
      this.selectAreaFromRoute();
    }
  }
}
</script>

<style lang="sass">
  .underline {
    border-top: 1px solid #BDBDBD;
    border-bottom: 1px solid #BDBDBD;
  }

  .parent-area {
    margin-left: 0px;
    text-transform: uppercase;
    font-weight: bold;
  }
</style>