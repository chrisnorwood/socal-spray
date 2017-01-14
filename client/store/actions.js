import { areasAPI } from '../services';

export const getInitialAreas = ({ commit }) => {
  areasAPI.getInitial( response => {
    console.log('response.data: ');
    commit('GET_INITIAL_AREAS', response.data);
  }, error => {
    console.log(error);
  });
};

export const setUserObject = ({ commit }, userObject) => {
  commit('SET_USER_OBJECT', userObject);
}

export const clearUserObject = ({ commit }) => {
  commit('CLEAR_USER_OBJECT');
}