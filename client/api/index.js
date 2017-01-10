import Vue from 'vue';
import axios from 'axios';
import VueAxios from 'vue-axios';

axios.defaults.baseURL = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : '';

Vue.use(VueAxios, axios);

export default {
  signUpUser (params, cb, ecb = null) {
    Vue.axios.post('users', params)
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error.response);
      });
  },
  getAllPuzzles (cb, ecb = null) {
    Vue.axios.get('puzzles')
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error);
      });
  },
}