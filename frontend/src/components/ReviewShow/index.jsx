import './reviewShow.css';
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';


const ReviewShow = ({review}) => {
    const dispatch = useDispatch();

    useEffect(() => {
    }, [])

    return(
        <>
            <div id="rs-master">
                <div>Name</div>
            </div>
        </>
    )
}

export default ReviewShow;