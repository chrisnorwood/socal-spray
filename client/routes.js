import Home from './components/Home.vue'

import Login from './components/auth/Login.vue'
import Signup from './components/auth/Signup.vue'

import Main from './components/dash/Main.vue'
import Dashboard from './components/dash/Dashboard.vue'
import Guide from './components/dash/Guide.vue'

export const routes = [
  { path: '/home',   alias: '/', name: 'home', component: Home, meta: { requiresAuth: false } },
  { path: '/signup',  name: 'signup', component: Signup, meta: { requiresAuth: false, excludesAuth: true } },
  { path: '/login',   name: 'login',  component: Login, meta: { requiresAuth: false, excludesAuth: true } },
  { path: '/main', component: Main,
    children: [
      { path: '',               name: 'dashboard', component: Dashboard, meta: { requiresAuth: true }, },
      { path: 'guide',          name: 'guide',     component: Guide,     meta: { requiresAuth: true }, },
      { path: 'guide/:area_id', name: 'area',      component: Guide,     meta: { requiresAuth: true }, },
    ],
    meta: { requiresAuth: true },
  },
  { path: '*', component: Home }
]