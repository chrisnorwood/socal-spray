<template>
  <div class="main-container">
    <h4>This is the login page</h4>
  </div>
</template>

<script>
import api from '../../api';

export default {
  data() {
    return {
      context: 'login context',
      data: {
        body: {
          email: 'cwncool@gmail.com',
          password: 'foobarfo'
        },
        rememberMe: false
      },
      error: null
    };
  },
  methods: {
    
  },
}
</script>

<style>
</style>