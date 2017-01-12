<template>
  <div>
    <ss-header></ss-header>
    <router-view></router-view>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import { auth } from './services';
import Header from './components/layout/Header.vue';

export default {
  name: 'app',
  components: {
    ssHeader: Header,
  },
  methods: {
    ...mapActions([
      'setUserObject',
    ]),
  },
  created() {
    const userObject = auth.userStorage();
    this.setUserObject(userObject);
  },
}
</script>

<style>
</style>
