<template>
  <div>
    <div class="area-nav">
      <md-whiteframe md-elevation="5">
        <md-list>
          <md-list-item v-if="selectedArea && areaHasParent">
            <router-link exact :to="selectedParentRoute">
              <md-icon>reply</md-icon>
              <span>Back</span>
            </router-link>
          </md-list-item>
          <md-list-item v-if="selectedArea">
            <md-icon>panorama</md-icon>
            <span class="underline">
              Areas in
              <span class="parent-area">
                {{ selectedArea.attributes.name }}:
              </span>
            </span>
          </md-list-item>
          <div v-for="area in areas">
            <md-list-item class="md-inset">
              <router-link :to="{ name: 'area' , params: { area_id: area.id } }">{{area.attributes.name}}</router-link>
            </md-list-item>
          </div>
        </md-list>
      </md-whiteframe>
    </div>

    <div class="dynamic-display" v-if="selectedArea">
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
                </md-card-header>

                <md-card-actions>
                  <md-button>Action</md-button>
                  <md-button>Action</md-button>
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
        return { name: 'area', params: { area_id: this.selectedArea.relationships.parent.data.id } };
      }

    }
  },
  mounted() {
    console.log('made it into mounted');
    if (this.isAreaSelected) {
      this.selectArea(this.$route.params);
    } else {
      this.selectArea({ area_id: 1 });
    }
  },
  beforeRouteEnter(to, from, next) {
    next(vm => {
      vm.$emit('selectBarItem', 'guide');
    })
  },
  watch: {
    $route () {
      console.log('made it into route watcher');
      if (this.isAreaSelected) {
        this.selectArea(this.$route.params);  
      } else {
        this.selectArea({ area_id: 1 });
      }
    }
  }
}
</script>

<style>
  .underline {
    border-top: 1px solid grey;
    border-bottom: 1px solid grey;
  }

  .parent-area {
    margin-left: 0px;
    text-transform: uppercase;
    font-weight: bold;
  }
</style>