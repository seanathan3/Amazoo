import csrfFetch from "./csrf";

const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";
const RECEIVE_REVIEW = "reviews/RECEIVE_REVIEW";
const REMOVE_ALL_REVIEWS = "reviews/REMOVE_ALL_REVIEWS";
const REMOVE_REVIEW = "reviews/REMOVE_REVIEW"


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

export const removeReview = reviewId => ({
    type: REMOVE_REVIEW,
    reviewId
})

export const fetchReviews = (itemId) => async dispatch => {
    const res = await csrfFetch(`/api/items/${itemId}/reviews`)
    const data = await res.json();
    dispatch(receiveReviews(data));
}

export const createReview = (review) => async dispatch => {
    const res = await csrfFetch(`/api/reviews`, {
        method: 'POST',
        body: JSON.stringify(review)
    });
    const data = await res.json();
    dispatch(receiveReview(data))
}

export const updateReview = (review) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${review.id}`, {
        method: 'PATCH',
        body: JSON.stringify(review)
    });
    const data = await res.json();
    dispatch(receiveReview(data));
}

export const deleteReview = (reviewId) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    })
    const data = await res.json();
    dispatch(removeReview(reviewId))
}


const reviewReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            return { ...state, ...action.reviews}
        case REMOVE_ALL_REVIEWS:
            return { };
        case REMOVE_REVIEW:
            let nextState = { ...state };
            delete nextState[action.reviewId];
            return nextState;
        default:
            return state
    }
}

export default reviewReducer;