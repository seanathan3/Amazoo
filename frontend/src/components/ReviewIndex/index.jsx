import { useDispatch, useSelector } from 'react-redux';
import './reviewIndex.css';
import { useEffect } from 'react';
import { fetchReviews, removeAllReviews } from '../../store/reviewReducer';
import ReviewShow from '../ReviewShow';
import { reviewProcesser } from '../../utils/utils';
import StarRatingBars from '../StarRatingBars';
import { useState } from 'react';
import { calcAverageRating } from '../../utils/utils';
import { Link } from 'react-router-dom';

const ReviewIndex = ({itemId, aggregate}) => {
    const dispatch = useDispatch();
    const reviews = useSelector(state => Object.values(state.reviews));
    const [avgRating, setAvgRating] = useState(0);

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
                        <div id="ri-stars">
                            <img id="ri-aggregate-pic" src={aggregate} alt="" />
                            <div id="ri-aggregate-text">{calcAverageRating(reviews)} out of 5</div>
                        </div>
                        <div id="ri-num-ratings">{Object.values(reviews).length} global { Object.values(reviews).length === 1 ? "rating" : "ratings"}</div>
                        <StarRatingBars reviews={reviews}/>


                        <div id="ri-add-review-container">
                            <div id="ri-add-bold" className="bold">Review this animal</div>
                            <div id="ri-add-text">Share your thoughts with other customers</div>
                            <Link id="ri-link" to="/">
                                <div id="ri-add-button">Write a customer review</div>
                            </Link>
                        </div>

                    </div>
                    <div id="ri-reviews">
                        <div className="bold" id="ri-reviews-header">Top reviews from the United States</div>

                        {reviews.map(review => {
                            return <ReviewShow key={review.id} review={review} />
                        })}

                    </div>
                </div>
            </div>
        </>
    )
}

export default ReviewIndex;