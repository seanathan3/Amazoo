import csrfFetch from "./csrf";

const RECEIVE_ITEMS = 'items/RECEIVE_ITEMS';
const RECEIVE_ITEM = 'items/RECEIVE_ITEM';

export const receiveItems = (items) => ({
    type: RECEIVE_ITEMS,
    items
})

export const receiveItem = (item) => ({
    type: RECEIVE_ITEM,
    item
})

export const fetchItems = () => async dispatch => {
    const res = await csrfFetch('/api/items');
    const data = await res.json();
    dispatch(receiveItems(data))
}

export const fetchItem = (itemId) => async dispatch => {
    const res = await csrfFetch(`/api/items/${itemId}`);
    const data = await res.json();
    dispatch(receiveItem(data.item))
}

export const fetchItemsByCategory = (category) => async dispatch => {
    const res = await csrfFetch('/api/items');
}

const itemReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_ITEM:
            let nextState = { ...state }
            nextState[action.item.id] = action.item;
            return nextState;
        case RECEIVE_ITEMS:
            return { ...state, ...action.items};
        default:
            return state;
    }
}

export default itemReducer;