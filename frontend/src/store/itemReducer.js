import csrfFetch from "./csrf";

const RECEIVE_ITEMS = 'items/RECEIVE_ITEMS';

export const receiveItems = (items) => ({
    type: RECEIVE_ITEMS,
    items
})

export const fetchItems = () => async dispatch => {
    const res = await csrfFetch('/api/items');
    const data = await res.json();
    dispatch(receiveItems(data))
}

export const fetchItemsByCategory = (category) => async dispatch => {
    const res = await csrfFetch('/api/items');
}

const itemReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_ITEMS:
            return { ...state, ...action.items}
        default:
            return state;
    }
}

export default itemReducer;