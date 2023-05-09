import './reviewError.css';
import pic from '../../assets/review-error.png';

const ReviewError = ({message}) => {
    
    if (!message) {
        return null
    }
    
    return(
        <div id="re-master">
            <img id="re-pic" src={pic} alt="error" />
            <p className="reviewError">{message}</p>
        </div>
    )
};

export default ReviewError;