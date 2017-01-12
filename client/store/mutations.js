export default {
  SET_USER_OBJECT(state, userObject) {
    state.userObject = userObject;
  },
  CLEAR_USER_OBJECT(state) {
    state.userObject = null;
  },
  GET_ALL_CLIMBS(state, climbs) {
    state.climbs = climbs;
  },
}