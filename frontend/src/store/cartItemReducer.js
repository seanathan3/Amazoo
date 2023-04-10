import csrfFetch from './csrf'

const RECEIVE_CART_ITEMS = 'cart_items/RECEIVE_CART_ITEMS';

export const receiveCartItems = (cartItems) => ({
    type: RECEIVE_CART_ITEMS,
    cartItems
})

export const fetchCartItems = (userId) => async dispatch => {
    let res = await csrfFetch(`/api/users/${userId}/cart_items`);
    const data = await res.json();
    dispatch(receiveCartItems(data))
}



const cartItemReducer = (state = {}, action) => {
    switch (action.type) {
        case RECEIVE_CART_ITEMS:
            return { ...state, ...action.cartItems }
        default:
            return state;
    }
}

export default cartItemReducer;