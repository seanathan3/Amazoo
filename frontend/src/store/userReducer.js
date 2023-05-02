import csrfFetch from './csrf'
const RECEIVE_USER = "users/RECEIVE_USER";

export const receiveUser = user => ({
    type: RECEIVE_USER,
    user
})

export const fetchUser = userId => async dispatch => {
    const res = await csrfFetch(`/api/users/${userId}`)
    const data = await res.json();
    dispatch(receiveUser(data.user))
}

const userReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_USER:
            let nextState = { ...state };
            nextState[action.user.id] = action.user;
            return nextState;
        default:
            return state
    }
}

export default userReducer;