import Vue from 'vue'
import App from './App.vue'

import VueMaterial from 'vue-material'
import './assets/styles.scss'
import 'vue-material/dist/vue-material.css'

import VueRouter from 'vue-router'
import { routes } from './routes'

import axios from 'axios';
import VueAxios from 'vue-axios';

import store from './store'

Vue.use(VueMaterial)
Vue.material.registerTheme('default', {
  primary: 'blue',
  accent: 'orange',
  warn: 'red',
  background: 'grey'
})


Vue.use(VueRouter)
const router = new VueRouter({routes})

axios.defaults.baseURL = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : '';
Vue.use(VueAxios, axios);


new Vue({
  el: '#app',
  store,
  router,
  render: h => h(App)
})
