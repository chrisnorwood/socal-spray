import { climbsAPI } from '../services';

export const getAllClimbs = ({ commit }) => {
  climbsAPI.getAll( response => {
    commit('GET_ALL_CLIMBS', response);
  }, error => {
    console.log(error);
  });
};