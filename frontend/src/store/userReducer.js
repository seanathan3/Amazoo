const RECEIVE_USER = "users/RECEIVE_USER";

const receiveUser = user => ({
    type: RECEIVE_USER,
    user
})

const userReducer = (state, action) => {
    switch (action.type) {
        default:
            return state
    }
}

export default userReducer;