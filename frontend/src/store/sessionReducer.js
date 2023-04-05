import csrfFetch, { storeCSRF } from './csrf'

const SET_CURRENT_USER = 'session/SET_CURRENT_USER';
const REMOVE_CURRENT_USER = 'session/REMOVE_CURRENT_USER';

export const setSessionUser = (user) => ({
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
    storeCurrentUser(data.user);
    dispatch(setSessionUser(data.user));
    return res
}

export const restoreSession = () => async dispatch => {
    const res = await csrfFetch('/api/session')
    storeCSRF(res);
    const data = await res.json();
    storeCurrentUser(data.user);
    dispatch(setSessionUser(data.user))
}

const storeCurrentUser = user => {
    if (user) sessionStorage.setItem('currentUser', JSON.stringify(user));
    else sessionStorage.removeItem('currentUser');
}

export const signUp = (user) => async dispatch => {
    const { name, email, password } = user
    const res = await csrfFetch('/api/users', {
        method: 'POST',
        body: JSON.stringify({ name, email, password })
    });
    const data = await res.json();
    storeCurrentUser(data.user);
    dispatch(setSessionUser(data.user));
    return res;
}

export const logout = () => async dispatch => {
    const res = await csrfFetch('/api/session', {
        method: 'DELETE'
    });
    storeCurrentUser(null);
    dispatch(removeSessionUser());
    return res;
}

const initialState = { user: JSON.parse(sessionStorage.getItem('currentUser')) }

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