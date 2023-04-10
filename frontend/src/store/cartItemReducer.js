import csrfFetch from './csrf'

const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS';
const RECEIVE_CART_ITEM = 'cart_items/RECEIVE_CART_ITEM';

export const receiveCartItems = (cartItems) => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
});

export const receiveCartItem = (cartItem) => ({
    type: RECEIVE_CART_ITEM,
    cartItem
});

export const fetchCartItems = (userId) => async dispatch => {
    let res = await csrfFetch(`/api/users/${userId}/cart_items`);
    const data = await res.json();
    dispatch(receiveCartItems(data))
}

export const createCartItem = (cartItem) => async dispatch => {
    let res = await csrfFetch('/api/cart_items', {
        method: 'POST',
        body: JSON.stringify(cartItem)
    });
    const data = await res.json();
    dispatch(receiveCartItem(data))
}

const cartItemReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CART_ITEMS:
            return { ...state, ...action.cartItems }
        case RECEIVE_CART_ITEM:
            let newState = { ...state }
            newState[action.cartItem.id] = action.cartItem;
            return newState;
        default:
            return state;
    }
}

export default cartItemReducer;