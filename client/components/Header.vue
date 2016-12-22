<template>
  <div>
    <md-toolbar>
      <h2 class="md-title" id="brand">
        <router-link :to="{ name: 'home' }">SC Spray</router-link>
      </h2>

      <router-link :to="{ name: 'dashboard' }">
        <md-button class="md-raised">Login</md-button>
      </router-link>
      <md-button class="md-icon-button">
        <md-icon>menu</md-icon>
      </md-button>
    </md-toolbar>
  </div>
</template>

<style scoped>
#brand {
  flex: 1;
  padding-left: 1em;
  font-size: 1.7em;
  font-weight: bold;
}

#brand a {
  color: white;
}

</style>