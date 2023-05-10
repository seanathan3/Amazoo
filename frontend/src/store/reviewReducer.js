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
    type: RECEIVE_REVIEW,
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

export const fetchReview = (reviewId) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${reviewId}`)
    const data = await res.json();
    dispatch(receiveReview(data.review));
}

export const createReview = (review) => async dispatch => {
    const res = await csrfFetch(`/api/reviews`, {
        method: 'POST',
        body: JSON.stringify(review)
    });
    const data = await res.json();
    dispatch(receiveReview(data.review))
}

export const updateReview = (review) => async dispatch => {
    const res = await csrfFetch(`/api/reviews/${review.id}`, {
        method: 'PATCH',
        body: JSON.stringify(review)
    });
    const data = await res.json();
    dispatch(receiveReview(data.review));
}

export const deleteReview = (reviewId) => async dispatch => {
    await csrfFetch(`/api/reviews/${reviewId}`, {
        method: 'DELETE'
    })
    dispatch(removeReview(reviewId))
}


const reviewReducer = (state={}, action) => {
    let nextState = { ...state };
    switch (action.type) {
        case RECEIVE_REVIEW:
            nextState[action.review.id] = action.review
            return nextState;
        case RECEIVE_REVIEWS:
            return { ...state, ...action.reviews}
        case REMOVE_ALL_REVIEWS:
            return { };
        case REMOVE_REVIEW:
            delete nextState[action.reviewId];
            return nextState;
        default:
            return state
    }
}

export default reviewReducer;