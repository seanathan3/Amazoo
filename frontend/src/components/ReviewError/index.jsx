import './reviewError.css';

const ReviewError = ({message}) => {
    
    if (!message) {
        return null
    }
    
    return(
        <div id="re-master">
            <p className="error">{message}</p>
        </div>
    )
};

export default ReviewError;