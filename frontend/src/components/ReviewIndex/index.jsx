import { useDispatch, useSelector } from 'react-redux';
import './reviewIndex.css';
import { useEffect } from 'react';
import { fetchReviews, removeAllReviews } from '../../store/reviewReducer';
import ReviewShow from '../ReviewShow';
import { reviewProcesser } from '../../utils/utils';
import StarRatingBars from '../StarRatingBars';
import { useState } from 'react';
import { calcAverageRating } from '../../utils/utils';
import { Link, Redirect } from 'react-router-dom';

const ReviewIndex = ({itemId, aggregate}) => {
    const dispatch = useDispatch();
    const reviews = useSelector(state => Object.values(state.reviews));
    const [avgRating, setAvgRating] = useState(0);
    const [referrer, setReferrer] = useState(false);
    const user = useSelector(state => state.session.user)

    useEffect(() => {
        dispatch(removeAllReviews())
        dispatch(fetchReviews(itemId));
    }, [])

    function handleClick(e) {
        if (!user) {
            e.preventDefault();
            setReferrer(true)
        }
    }

    if (referrer) {
        return <Redirect to="/login" />
    }   


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
                            <Link id="ri-link" to={`/reviews/${itemId}`} onClick={handleClick}>
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