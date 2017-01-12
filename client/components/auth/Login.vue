<template>
  <div class="main-container">
    <section class="page-title">
      <h1>Login</h1>
    </section>
    
    <section class="form">

      <form @submit.prevent="submitForm">
        <md-input-container :class="{ 'md-input-invalid': error }">
          <label>Email</label>
          <md-input v-model="form.auth.email"></md-input>
          <span v-if="error" class="md-error">{{error}}</span>
        </md-input-container>
        
        <md-input-container :class="{ 'md-input-invalid': error }">
          <label>Password</label>
          <md-input type="password" v-model="form.auth.password"></md-input>
        </md-input-container>
        
        <md-button type="submit" class="md-raised md-primary">Log in</md-button>
      </form>

      <span>
        <br>
        <router-link :to="{ name: 'signup' }">(Create New Account)</router-link>
      </span>
    </section>
  </div>
</template>

<script>
import { mapActions } from 'vuex';
import { userAPI, ls } from '../../services';

export default {
  data() {
    return {
      form: {
        auth: {
          email: '',
          password: ''
        },
      },
      error: null,
    };
  },
  methods: {
    ...mapActions([
      'setUserObject',
    ]),
    submitForm() {
      const authUser = {};

      userAPI.login(this.form,
        success => {
          this.error = null;
          authUser.accessToken = success.jwt
          ls.set('authUser', authUser);

          userAPI.currentUser(
            userObject => {
              authUser.email = userObject.data.attributes.email;
              authUser.name  = userObject.data.attributes.name;
              ls.set('authUser', authUser);
              this.setUserObject(authUser);
              this.$router.push({ name: 'dashboard' });
            },
            failure => {
              this.error = 'Login failed.  Try again.';
            }
          );
        }, failure => {
          this.error = 'User not found.  Try again.';
        });
    },
  },
}
</script>

<style>
</style>