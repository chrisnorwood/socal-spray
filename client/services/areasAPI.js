import Vue from 'vue';

export const areasAPI = {
  getInitial (cb, ecb = null) {
    Vue.axios.get('areas')
      .then(response => {
        cb(response.data);
      })
      .catch(error => {
        ecb(error);
      });
  },
}