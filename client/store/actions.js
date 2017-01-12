import { climbsAPI } from '../services';

export const getAllClimbs = ({ commit }) => {
  climbsAPI.getAll( response => {
    commit('GET_ALL_CLIMBS', response);
  }, error => {
    console.log(error);
  });
};

export const setUserObject = ({ commit }, userObject) => {
  commit('SET_USER_OBJECT', userObject);
}