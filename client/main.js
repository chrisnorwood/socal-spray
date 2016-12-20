import Vue from 'vue'
import App from './App.vue'
import store from './store'

import Keen from 'keen-ui';
Vue.use(Keen);

import 'keen-ui/dist/keen-ui.css'
import './assets/styles.scss'

new Vue({
  el: '#app',
  store,
  render: h => h(App)
})
