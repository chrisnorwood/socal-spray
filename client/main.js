import Vue from 'vue'
import App from './App.vue'
import store from './store'

import Materials from 'vue-materials'

Vue.use(Materials)

new Vue({
  el: '#app',
  store,
  render: h => h(App)
})
