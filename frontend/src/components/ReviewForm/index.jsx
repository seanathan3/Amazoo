import './reviewForm.css';
import { useParams, useHistory } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect, useState } from 'react';
import { fetchItem } from '../../store/itemReducer';
import filledStar from '../../assets/review-stars/review-star-filled.svg';
import blankStar from '../../assets/review-stars/review-star-blank.svg';
import { createReview } from '../../store/reviewReducer'
import ReviewError from '../ReviewError';

const ReviewForm = () => {
    const dispatch = useDispatch();
    const history = useHistory();
    const { itemId } = useParams();
    const { reviewId } = useParams();
    const item = useSelector(state => state.items[itemId]);
    const user = useSelector(state => state?.session.user);

    const [rating, setRating] = useState(0);
    const [title, setTitle] = useState("");
    const [body, setBody] = useState("");
    const [errors, setErrors] = useState([]);

    useEffect(() => {
        dispatch(fetchItem(itemId))

        if (reviewId) {
            // dispatch(fetchRev)
        }
    }, [itemId])

    function handleSubmit(e) {
        e.preventDefault();
        let newReview = {
            rating: rating,
            title: title,
            body: body,
            commenterId: user.id,
            itemId: parseInt(itemId)
        }
        dispatch(createReview(newReview))
            .then(() => {
                history.push(`/items/${itemId}`)
            })
            .catch( async (res) => {
                let data;
                try {
                    data = await res.clone().json();
                } catch {
                    data = await res.text();
                }
                if (data?.errors) setErrors(data.errors);
                else if (data) setErrors([data]);
                else setErrors([res.statusText]);
            });
    }

    return (
        <>
            <form id="rf-master" onSubmit={handleSubmit}>

                <div id="rf-header-box">
                    <div id="rf-header-bold" className="bold">Create Review</div>
                    <div id="rf-item-info">
                        <img id="rf-photo" src={item?.photoUrl} alt="" />
                        <div id="rf-header-text">{item?.name}</div>
                    </div>
                </div>

                <div id="rf-rating-box">
                    <div id="rf-rating-text" className="bold">Overall Rating</div>
                    <div id="rf-stars-box">
                        <img className="rf-review-star" id="rf-star-1" onClick={() => setRating(1)} src={ rating >= 1 ? filledStar : blankStar} alt="" />
                        <img className="rf-review-star" id="rf-star-2" onClick={() => setRating(2)} src={ rating >= 2 ? filledStar : blankStar} alt="" />
                        <img className="rf-review-star" id="rf-star-3" onClick={() => setRating(3)} src={ rating >= 3 ? filledStar : blankStar} alt="" />
                        <img className="rf-review-star" id="rf-star-4" onClick={() => setRating(4)} src={ rating >= 4 ? filledStar : blankStar} alt="" />
                        <img className="rf-review-star" id="rf-star-5" onClick={() => setRating(5)} src={ rating >= 5 ? filledStar : blankStar} alt="" />
                    </div>
                    
                    {errors[0]?.includes("Rating must be in 1..5") &&
                        <ReviewError message="Please select a star rating"/>
                    }
                </div>


                <div id="rf-title-box">
                    <div id="rf-title-bold" className="bold">Add a headline</div>
                    <input type="text" id="rf-title-input" className="rf-input" placeholder="What's most important to know?" value={title} onChange={e => setTitle(e.target.value)} />

                    {errors[0]?.includes("Title is too short (minimum is 1 character)") && 
                        <ReviewError message="Please enter your headline."/>
                    }
                </div>


                <div id="rf-body-box">
                    <div id="rf-body-bold" className="bold">Add a written review</div>
                    <textarea type="textarea" id="rf-body-input" className="rf-input" placeholder="What did you like or dislike? What was your experience with this animal?" value={body} onChange={e => setBody(e.target.value)}/>
                
                
                    {errors[0]?.includes("Body is too short (minimum is 1 character)") && 
                        <ReviewError message="Please add a written review"/>
                    }
                </div>


                <div id="rf-button-box">
                    <button id="rf-submit">Submit</button>
                </div>
            </form>
        </>
    )
};

export default ReviewForm;