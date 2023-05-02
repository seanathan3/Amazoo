import { reviewProcesser } from "../../utils/utils";
import five from '../../assets/amazon-stars/amazon-stars-10.png';
import './starRatingBars.css';

const StarRatingBars = ({reviews}) => {
    if (Object.values(reviews).length === 0) {
        return (
            <div>No reviews!</div>
        )
    }

    let percentages = reviewProcesser(reviews).percentages
    let counts = reviewProcesser(reviews).counts



    return(
        <>
        <div id="srb-master">
            {[4, 3, 2, 1, 0].map(ele => {
                return (
                    <div className="srb-row" key={ele}>
                        <div>{ele + 1} star</div>
                        <div id="srb-meter" >
                            <div id="srb-filler" style={{width: `${percentages[ele]}%`}} />
                        </div>
                        <div id="srb-percent">{percentages[ele]}%</div>
                    </div>
                )
            })}
        </div>
        </>
    )
};

export default StarRatingBars;