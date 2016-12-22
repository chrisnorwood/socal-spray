import Vue from 'vue'
import VueRouter from 'vue-router'
import { routes } from './routes'
import App from './App.vue'
import store from './store'

import VueMaterial from 'vue-material'
import './assets/styles.scss'
import 'vue-material/dist/vue-material.css'

Vue.use(VueMaterial)
Vue.material.registerTheme('default', {
  primary: 'blue',
  accent: 'red',
  warn: 'orange',
  background: 'grey'
})


Vue.use(VueRouter)

const router = new VueRouter({routes})

new Vue({
  el: '#app',
  store,
  router,
  render: h => h(App)
})
