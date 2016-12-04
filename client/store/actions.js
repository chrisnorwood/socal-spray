import api from '../api';

export const getAllPuzzles = ({ commit }) => {
  api.getAllPuzzles( puzzles => {
    commit('GET_ALL_PUZZLES', puzzles);
  }, error => {
    console.log(error);
  });
};