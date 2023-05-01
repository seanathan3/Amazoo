import { useDispatch, useSelector } from 'react-redux';
import './reviewIndex.css';
import { useEffect } from 'react';
import { fetchReviews, removeAllReviews } from '../../store/reviewReducer';
import ReviewShow from '../ReviewShow';

const ReviewIndex = ({itemId}) => {
    const dispatch = useDispatch();
    const reviews = useSelector(state => Object.values(state.reviews));

    useEffect(() => {
        dispatch(removeAllReviews())
        dispatch(fetchReviews(itemId));
    }, [])

    return(
        <>
            <div id="ri-master">
                <div id="ri-top-divider" />

                <div id="ri-container">
                    <div id="ri-databox">
                        <div className="bold" id="ri-bold-text">Customer Reviews</div>
                    </div>
                    <div id="ri-reviews">
                        <div className="bold" id="ri-reviews-header">Top reviews from the United States</div>

                        {reviews.map(review => {
                            return <ReviewShow review={review} />
                        })}

                    </div>
                </div>
            </div>
        </>
    )
}

export default ReviewIndex;