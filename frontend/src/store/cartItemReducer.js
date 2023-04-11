import csrfFetch from './csrf'

const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS';
const RECEIVE_CART_ITEM = 'cart_items/RECEIVE_CART_ITEM';
const REMOVE_CART_ITEM = 'cart_items/REMOVE_CART_ITEM';
const REMOVE_ALL_CART_ITEMS = 'cart_items/REMOVE_ALL_CART_ITEMS'

export const receiveCartItems = (cartItems) => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
});

export const receiveCartItem = (cartItem) => ({
    type: RECEIVE_CART_ITEM,
    cartItem
});

export const removeCartItem = (cartItemId) => ({
    type: REMOVE_CART_ITEM,
    cartItemId
})

export const removeAllCartItems = () => ({
    type: REMOVE_ALL_CART_ITEMS
}) 

export const fetchCartItems = (userId) => async dispatch => {
    const res = await csrfFetch(`/api/users/${userId}/cart_items`);
    const data = await res.json();
    dispatch(receiveCartItems(data))
}

export const createCartItem = (cartItem) => async dispatch => {
    const res = await csrfFetch('/api/cart_items', {
        method: 'POST',
        body: JSON.stringify(cartItem)
    });
    const data = await res.json();
    dispatch(receiveCartItem(data))
}

export const deleteCartItem = (cartItemId) => async dispatch => {
    const res = await csrfFetch(`/api/cart_items/${cartItemId}`, {
        method: 'DELETE'
    });
    const data = await res.json();
    dispatch(removeCartItem(cartItemId))
}

export const updateCartItem = (cartItem) => async dispatch => {
    const res = await csrfFetch(`/api/cart_items/${cartItem.id}`, {
        method: 'PATCH',
        body: JSON.stringify(cartItem)
    });
    const data = await res.json();
    dispatch(receiveCartItem(data));
}

const cartItemReducer = (state = {}, action) => {
    let newState = { ...state }
    switch (action.type) {
        case RECEIVE_CART_ITEMS:
            return { ...state, ...action.cartItems }
        case RECEIVE_CART_ITEM:
            newState[action.cartItem.id] = action.cartItem;
            return newState;
        case REMOVE_CART_ITEM:
            delete newState[action.cartItemId];
            return newState;
        case REMOVE_ALL_CART_ITEMS:
            return { }
        default:
            return state;
    }
}

export default cartItemReducer;