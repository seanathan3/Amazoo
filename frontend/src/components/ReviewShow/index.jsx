import './reviewShow.css';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import userPic from '../../assets/user_pic.jpeg';


const ReviewShow = ({review}) => {
    const dispatch = useDispatch();
    const name = useSelector

    useEffect(() => {

    }, [])

    return(
        <>
            <div id="rs-master">
                <div id="rs-name-box">
                    <img id="rs-pic" src={userPic} alt="" />
                    <div id="rs-name"></div>
                </div>
                <div>{review.rating} stars</div>
                <div>{review.body}</div>
            </div>
        </>
    )
}

export default ReviewShow;