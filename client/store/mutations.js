export default {
  SET_USER_OBJECT(state, userObject) {
    state.userObject = userObject;
  },
  CLEAR_USER_OBJECT(state) {
    state.userObject = null;
  },
  GET_INITIAL_AREAS(state, areas) {
    state.areas = areas;
  },
  SELECT_AREA(state, areasResponse) {
    state.selectedArea = areasResponse.data;
    state.areas = areasResponse.included;
  }
}