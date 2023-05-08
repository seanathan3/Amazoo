import { useParams, Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect, useRef } from "react";
import { fetchItem } from "../../store/itemReducer";
import Price from "../Price";
import AddItemForm from "../AddItemForm";
import './itemShow.css';
import PageNotFound from "../PageNotFound";
import ReviewIndex from "../ReviewIndex";
import { fetchReviews, removeAllReviews } from "../../store/reviewReducer";
import one from '../../assets/amazon-stars/amazon-stars-2.png';
import oneP from '../../assets/amazon-stars/amazon-stars-3.png';
import two from '../../assets/amazon-stars/amazon-stars-4.png';
import twoP from '../../assets/amazon-stars/amazon-stars-5.png';
import three from '../../assets/amazon-stars/amazon-stars-6.png';
import threeP from '../../assets/amazon-stars/amazon-stars-7.png';
import four from '../../assets/amazon-stars/amazon-stars-8.png';
import fourP from '../../assets/amazon-stars/amazon-stars-9.png';
import five from '../../assets/amazon-stars/amazon-stars-10.png';
import { useState } from "react";
import { calcAverageRating } from "../../utils/utils";


const ItemShow = () => {
    const dispatch = useDispatch();
    let { itemId } = useParams();
    const item = useSelector(state => state?.items[itemId] ? state.items[itemId] : null)
    const reviews = useSelector(state => Object.values(state?.reviews))
    const [avg, setAvg] = useState(0);
    const reviewRef = useRef(null);

    const handleReviewsClick = () => {
        if (reviewRef?.current) {
          window.scrollTo({
            top: reviewRef.current.offsetTop,
            behavior: "smooth",
          });
        }
      };


    useEffect(() => {
        dispatch(fetchItem(itemId));
        dispatch(removeAllReviews())
        dispatch(fetchReviews(itemId))
        
    }, [itemId, dispatch])
    
    function parseDescription(desc) {
        let output = desc.split('.')
        return output.slice(0, output.length - 1)
    }

    const descArr = item?.description ? parseDescription(item?.description) : []

    if (!item) {
        return(
            <PageNotFound />
        )
    }

    let pic;
    let myRating = calcAverageRating(reviews);
    console.log(myRating);
    if (myRating >= 4.8) {
        pic = five;
    } else if (myRating >= 4.3) {
        pic = fourP;
    } else if (myRating >= 3.8) {
        pic = four;
    } else if (myRating >= 3.3) {
        pic = threeP;
    } else if (myRating >= 2.8) {
        pic = three;
    } else if (myRating >= 2.3) {
        pic = twoP;
    } else if (myRating >= 1.8) {
        pic = two;
    } else if (myRating >= 1.3) {
        pic = oneP;
    } else {
        pic = one;
    }

    return (
        <>
            <div id="showMaster">
                <div id="showImageBox" className="cardItemImageBox">
                    <img id="showPageImage" src={item?.photoUrl} alt="" />
                </div>
                <div id="showContent">
                    <div id="showName">{item?.name}</div>
                    <Link to={`/category/${item?.animalType}`}>
                        <div id="showType" className="showLink">{item?.animalType}</div>
                    </Link>

                    <div id="is-avg-reviews">
                        <div>{calcAverageRating(reviews)}</div>
                        <img id="is-rating-pic"src={pic} alt="" />
                        <Link
                            to={`/items/${item.id}#${reviewRef?.current?.id}`}
                            onClick={handleReviewsClick}
                        >
                            <div id="is-relative-link-text" className="showLink">{Object.keys(reviews).length} {Object.keys(reviews).length === 1 ? "rating" : "ratings"}</div>
                        </Link>
                    </div>

                    {console.log(reviewRef.current?.id)}

                    <div id="showDivider"></div>
                    
                    <Price price={item?.price}/>
                    <div id="freeReturns">FREE Returns</div>
                    
                    <div id="showDivider"></div>
                    
                    <div id="showDescBox">
                        <h3>About this animal</h3>
                        <ul id="descList">
                            {descArr.map(fact => {
                                return <li key={fact} className="bullet">{fact}</li>
                            })}
                        </ul>
                    </div>

                </div>

                <AddItemForm price={item?.price}/>
            </div>

            <div ref={reviewRef} id="is-scroll-div"></div>
            <ReviewIndex itemId={itemId} aggregate={pic} />
        </>
    )
}

export default ItemShow;