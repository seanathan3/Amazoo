import './reviewShow.css';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import userPic from '../../assets/user_pic.jpeg';
import { fetchUser } from '../../store/userReducer';
import one from '../../assets/amazon-stars/amazon-stars-2.png'
import two from '../../assets/amazon-stars/amazon-stars-2.png'
import three from '../../assets/amazon-stars/amazon-stars-2.png'
import four from '../../assets/amazon-stars/amazon-stars-2.png'
import five from '../../assets/amazon-stars/amazon-stars-2.png'




const ReviewShow = ({review}) => {
    const dispatch = useDispatch();
    const user = useSelector(state => state.users[review.commenterId])

    useEffect(() => {
            dispatch(fetchUser(review.commenterId))
    }, [])

    return(
        <>
            <div id="rs-master">
                <div id="rs-name-box">
                    <img id="rs-pic" src={userPic} alt="" />
                    <div id="rs-name">{user?.name}</div>
                </div>
                <div id="rs-line-2">
                    <div>{review.rating} stars</div>

                </div>
                <div>{review.body}</div>
            </div>
        </>
    )
}

export default ReviewShow;