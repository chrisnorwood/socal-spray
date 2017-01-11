import Vue from 'vue';

export const climbsAPI = {
  getAll (cb, ecb = null) {
    Vue.axios.get('puzzles')
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error);
      });
  },
}