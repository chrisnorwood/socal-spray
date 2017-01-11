import Vue from 'vue';

export const userAPI = {
  signUp (params, cb, ecb = null) {
    Vue.axios.post('users', params)
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error.response);
      });
  },
  login (params, cb, ecb = null) {
    Vue.axios.post('user_token', params)
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error.response);
      });
  },
  currentUser (cb, ecb = null) {
    Vue.axios.get('current_user')
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error.response);
      });
  }
}