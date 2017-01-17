import Vue from 'vue'
import App from './App.vue'

import VueMaterial from 'vue-material'
import './assets/styles.scss'
import 'vue-material/dist/vue-material.css'

import VueRouter from 'vue-router'
import { routes } from './routes'

import axios from 'axios';
import VueAxios from 'vue-axios';

import { ls, auth } from './services'
import store from './store'

Vue.use(VueMaterial)
Vue.material.registerTheme('default', {
  primary: 'blue',
  accent: 'orange',
  warn: 'red',
  background: 'grey'
})


Vue.use(VueRouter);
const router = new VueRouter({routes});

// Router Guard (auth)
router.beforeEach((to, from, next) => {
  if (to.matched.some(record => {
    return record.meta.requiresAuth || false;
  })) {
    // If page requires auth, redirect to login if no token
    auth.tokenExists() ? next() : next('/login');

    if (auth.tokenExists()) {
      if (auth.tokenExpired()) {
        ls.remove('authUser');
        next('/login');
      } else {
        next();
      }
    } else {
      next('/login');
    }
  } else {
    if (to.matched.some(record => {
      return record.meta.excludesAuth || false;
    })) {
      // If page excludes authed users, redirect to dash for authed users
      auth.tokenExists() ? next('/main') : next();
    } else {
      next();
    }
  }
})

axios.defaults.baseURL = process.env.NODE_ENV === 'development' ? 'http://localhost:3000' : '';
axios.interceptors.request.use(config => { 
  config.headers.Authorization = 'Bearer ' + auth.getToken();
  return config;
});
Vue.use(VueAxios, axios);


new Vue({
  el: '#app',
  store,
  router,
  render: h => h(App)
})
