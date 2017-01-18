import Vue from 'vue';
import { ls } from '../services';

export const auth = {
  tokenExists() {
    return !!ls.get('authUser');
  },
  getToken() {
    let authUser = ls.get('authUser');
    return authUser ? authUser.accessToken : false;
  },
  userStorage() {
    return ls.get('authUser');
  },
  tokenExpired() {
    let authUser = ls.get('authUser');
    
    let expTime  = authUser.expTime;
    let now      = new Date().getTime();
    
    return ((now - expTime) > 0) ? true : false;
  }
}