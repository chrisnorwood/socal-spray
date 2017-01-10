import Home from './components/Home.vue'

import Login from './components/auth/Login.vue'
import Signup from './components/auth/Signup.vue'

import Main from './components/dash/Main.vue'
import Dashboard from './components/dash/Dashboard.vue'
import Guide from './components/dash/Guide.vue'

export const routes = [
  { path: '/home',   alias: '/', name: 'home', component: Home },
  { path: '/login',  name: 'login', component: Login },
  { path: '/signup', name: 'signup', component: Signup },
  { path: '/main', component: Main, 
    children: [
      { path: '/',     name: 'dashboard', component: Dashboard },
      { path: '/guide', name: 'guide',     component: Guide },
    ]
  },
]