import csrfFetch from "./csrf";

const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";
const RECEIVE_REVIEW = "reviews/RECEIVE_REVIEW";
const REMOVE_ALL_REVIEWS = "reviews/REMOVE_ALL_REVIEWS";


export const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    reviews
})

export const receiveReview = review => ({
    type: RECEIVE_REVIEWS,
    review
})

export const removeAllReviews = () => ({
    type: REMOVE_ALL_REVIEWS,
})

export const fetchReviews = (itemId) => async dispatch => {
    const res = await csrfFetch(`/api/items/${itemId}/reviews`)
    const data = await res.json();
    dispatch(receiveReviews(data));
}


const reviewReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            return { ...state, ...action.reviews}
        case REMOVE_ALL_REVIEWS:
            return { }
        default:
            return state
    }
}

export default reviewReducer;