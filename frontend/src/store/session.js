import csrfFetch from './csrf'

const SET_CURRENT_USER = 'session/SET_CURRENT_USER';
const REMOVE_CURRENT_USER = 'session/REMOVE_CURRENT_USER';

export const addSessionUser = (user) => ({
    type: SET_CURRENT_USER,
    user
})

export const removeSessionUser = () => ({
    type: REMOVE_CURRENT_USER
})

export const login = user => async dispatch => {
    const { email, password } = user
    const res = await csrfFetch('api/session', {
        method: 'POST',
        body: JSON.stringify({email, password})
    })
    const data = await res.json();
    dispatch(addSessionUser(data.user));
    return res
}

const initialState = { user: null }

const sessionReducer = (state=initialState, action) => {
    switch (action.type) {
        case SET_CURRENT_USER:
            return { ...state, user: action.user };
        case REMOVE_CURRENT_USER:
            return { ...state, user: null }
        default:
            return state;
    }
}

export default sessionReducer;