const RECEIVE_REVIEWS = "reviews/RECEIVE_REVIEWS";

export const receiveReviews = reviews => ({
    type: RECEIVE_REVIEWS,
    reviews
})


const reviewReducer = (state={}, action) => {
    switch (action.type) {
        case RECEIVE_REVIEWS:
            return { ...state, ...action.reviews}
        default:
            return state
    }
}

export default reviewReducer;