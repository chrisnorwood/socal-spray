<template>
  <div class="main-container">
    <section class="page-title">
      <h1>Create new account</h1>
    </section>
    <section class="signup-form">
      <md-dialog-alert
        :md-title="successAlert.title"
        :md-content="successAlert.content"
        :md-ok-text="successAlert.ok"
        @close="closeSuccessAlert"
        ref="successAlert">
      </md-dialog-alert>

      <form @submit.prevent="submitForm">
        <md-input-container :class="{ 'md-input-invalid': errors.name }">
          <label>Name</label>
          <md-input required v-model="form.user.name"></md-input>
          <span v-if="errors.name" class="md-error">
            <span v-for="error in errors.name">
              {{error}}. 
            </span>
          </span>
        </md-input-container>

        <md-input-container :class="{ 'md-input-invalid': errors.email }">
          <label>Email</label>
          <md-input required v-model="form.user.email"></md-input>
          <span v-if="errors.email" class="md-error">
            <span v-for="error in errors.email">
              {{error}}. 
            </span>
          </span>
        </md-input-container>
        
        <md-input-container :class="{ 'md-input-invalid': errors.password }">
          <label>Password</label>
          <md-input required type="password" v-model="form.user.password"></md-input>
          <span v-if="errors.password" class="md-error">
            <span v-for="error in errors.password">
              {{error}}. 
            </span>
          </span>
        </md-input-container>
        
        <md-input-container :class="{ 'md-input-invalid': errors.password_confirmation }">
          <label>Password confirmation</label>
          <md-input required type="password" v-model="form.user.password_confirmation"></md-input>
          <span v-if="errors.password_confirmation" class="md-error">
            <span v-for="error in errors.password_confirmation">
              {{error}}. 
            </span>
          </span>
        </md-input-container>
        
        <md-button type="submit" class="md-raised md-primary">Sign Up</md-button>
      </form>
    </section>
  </div>
</template>

<script>
import { userAPI } from '../../services';

export default {
  data() {
    return {
      form: {
        user: {
          name: '',
          email: '',
          password: '',
          password_confirmation: '',
        },
      },
      errors: {},
      successAlert: {
        title: 'Account Created',
        content: 'Your account was successfully created!  You may now login.',
        ok: 'Login',
      },
    }
  },
  methods: {
    submitForm() {
      userAPI.signUp(this.form,
        success => {
          console.log(success);
          this.$refs['successAlert'].open();
        }, error => {
          this.errors = error.data.errors;
        });
    },
    closeSuccessAlert() {
      this.$router.push({ name: 'login' });
    },
  },
}
</script>