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
  currentUser() {

  }
}