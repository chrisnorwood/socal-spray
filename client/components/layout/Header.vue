<template>
  <div>
    <md-toolbar>
      <h2 class="md-title" id="brand">
        <router-link :to="{ name: 'home' }">SC Spray</router-link>
      </h2>

      <md-button class="md-icon-button" @click="$refs.sidenav.toggle()" v-if="userObject !== null">
        <md-icon>menu</md-icon>
      </md-button>

      <router-link :to="{ name: 'login' }" v-else>
        <md-button class="md-raised">Login</md-button>
      </router-link>

    </md-toolbar>

    <md-sidenav class="md-right" ref="sidenav" v-if="userObject">
      <md-toolbar class="md-account-header">
        <md-list class="md-transparent">
          <md-list-item class="md-avatar-list">
            <md-avatar class="md-large">
              <img src="https://placeimg.com/64/64/people/8" alt="People">
            </md-avatar>

            <span style="flex: 1"></span>

            <md-avatar>
              <img src="https://placeimg.com/40/40/people/3" alt="People">
            </md-avatar>

            <md-avatar>
              <img src="https://placeimg.com/40/40/people/4" alt="People">
            </md-avatar>
          </md-list-item>

          <md-list-item>
            <div class="md-list-text-container">
              <span>{{ userObject.name }}</span>
              <span>{{ userObject.email}}</span>
            </div>
          </md-list-item>
        </md-list>
      </md-toolbar>

      <md-list>
        <md-list-item @click="handleDashNav">
          <md-icon>dashboard</md-icon> <span>My dashboard</span>
        </md-list-item>

        <md-list-item @click="handleLogout">
          <md-icon>power_settings_new</md-icon> <span>Logout</span>
        </md-list-item>
      </md-list>
    </md-sidenav>

  </div>
</template>

<script>
import { mapActions, mapGetters } from 'vuex';
import { ls } from '../../services';

export default {
  methods: {
    ...mapActions([
      'clearUserObject',
    ]),
    handleDashNav() {
      this.$refs.sidenav.toggle();
      this.$router.push({ name: 'dashboard' });
    },
    handleLogout() {
      this.$refs.sidenav.toggle();
      this.clearUserObject();
      ls.remove('authUser');
      this.$router.push({ name: 'login' });
    },
  },
  computed: {
    ...mapGetters([
      'userObject',
    ]),
  },
}
</script>

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