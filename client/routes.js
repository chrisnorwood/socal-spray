import Home from './components/Home.vue'
import Main from './components/Main.vue'
import Login from './components/Login.vue'
import Signup from './components/Signup.vue'

import Dashboard from './components/Dashboard.vue'
import Guide from './components/Guide.vue'

export const routes = [
  { path: '/home',   alias: '/', name: 'home', component: Home },
  { path: '/login',  name: 'login', component: Login },
  { path: '/signup', name: 'signup', component: Signup },
  { path: '/main', component: Main, 
    children: [
      { path: '/',     name: 'dashboard', component: Dashboard },
      { path: 'guide', name: 'guide',     component: Guide },
    ]
  },
]