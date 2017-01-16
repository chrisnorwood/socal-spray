import { areasAPI } from '../services';

export const getInitialAreas = ({ commit }) => {
  areasAPI.getInitial( response => {
    commit('GET_INITIAL_AREAS', response.data);
  }, error => {
    console.log(error);
  });
};

export const selectArea = ({ commit }, params) => {
  areasAPI.select(params, response => {
    commit('SELECT_AREA', response)
  }, error => {
    console.log(error);
  });
}

export const setUserObject = ({ commit }, userObject) => {
  commit('SET_USER_OBJECT', userObject);
}

export const clearUserObject = ({ commit }) => {
  commit('CLEAR_USER_OBJECT');
}