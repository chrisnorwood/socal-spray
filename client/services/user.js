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
}