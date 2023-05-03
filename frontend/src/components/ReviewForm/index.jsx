import './reviewForm.css';
import { useParams } from 'react-router-dom';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import { fetchItem } from '../../store/itemReducer';
import filledStar from '../../assets/review-stars/review-star-filled.svg';

const ReviewForm = () => {
    const dispatch = useDispatch();
    const { itemId } = useParams();
    const item = useSelector(state => state.items[itemId])

    useEffect(() => {
        dispatch(fetchItem(itemId))
    }, [itemId])

    return (
        <>
            <form id="rf-master">

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
                        <img className="rf-review-star" id="rf-star-1" src={filledStar} alt="" />
                        <img className="rf-review-star" id="rf-star-2" src={filledStar} alt="" />
                        <img className="rf-review-star" id="rf-star-3" src={filledStar} alt="" />
                        <img className="rf-review-star" id="rf-star-4" src={filledStar} alt="" />
                        <img className="rf-review-star" id="rf-star-5" src={filledStar} alt="" />
                    </div>
                </div>

                <div id="rf-title-box">
                    <div id="rf-title-bold" className="bold">Add a headline</div>
                    <input type="text" id="rf-title-input" className="rf-input" placeholder="What's most important to know?" />
                </div>

                <div id="rf-body-box">
                    <div id="rf-body-bold" className="bold">Add a written review</div>
                    <textarea type="textarea" id="rf-body-input" className="rf-input" placeholder="What did you like or dislike? What was your experience with this animal?"/>
                </div>

                <div id="rf-button-box">
                    <div id="rf-submit">Submit</div>
                </div>
            </form>
        </>
    )
};

export default ReviewForm;