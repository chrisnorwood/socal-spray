<template>
  <div>
    <div class="main-container">
      <router-view @selectBarItem="selectBarItem"></router-view>
    </div>
    <md-bottom-bar id="bottom" class="bottom-fixed">
      <md-bottom-bar-item 
        md-icon="dashboard"
        :md-active="isActiveTab('dashboard')"
        @click.native="navigateTo('dashboard')"
      >
        Dashboard
      </md-bottom-bar-item>
      <md-bottom-bar-item 
        md-icon="panorama"
        :md-active="isActiveTab('guide')"
        @click.native="navigateTo('guide')"
      >
        Guidebook
      </md-bottom-bar-item>
    </md-bottom-bar>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeTab: 'dashboard'
    }
  },
  methods: {
    navigateTo(namedRoute) {
      this.$router.push({ name: namedRoute });
    },
    selectBarItem(item) {
      this.activeTab = item;
    },
    isActiveTab(tabName) {
      return this.activeTab === tabName;
    },
  },
}
</script>

<style scoped>
#bottom {
  background-color: white;
}

#bottom a:hover {
  text-decoration: none;
}

.bottom-fixed {
  position: fixed;
  bottom: 0px;
  right: 0px;
}
</style>