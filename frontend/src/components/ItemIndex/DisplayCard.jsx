import { Link } from 'react-router-dom';
import Price from '../Price';
import './items.css'
import one from '../../assets/amazon-stars/amazon-stars-2.png';
import oneP from '../../assets/amazon-stars/amazon-stars-3.png';
import two from '../../assets/amazon-stars/amazon-stars-4.png';
import twoP from '../../assets/amazon-stars/amazon-stars-5.png';
import three from '../../assets/amazon-stars/amazon-stars-6.png';
import threeP from '../../assets/amazon-stars/amazon-stars-7.png';
import four from '../../assets/amazon-stars/amazon-stars-8.png';
import fourP from '../../assets/amazon-stars/amazon-stars-9.png';
import five from '../../assets/amazon-stars/amazon-stars-10.png';
import { calcAverageRating } from '../../utils/utils';
import { useSelector } from 'react-redux';
import { useEffect } from 'react';

const DisplayCard = ({item}) => {

    let pic;
    let myRating = parseFloat(item.avgRating)
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

    function handleClick() {
        window.scrollTo(0, 0)
    }

    return (
        <>
            <div className="card">
                <div className="cardItemImageBox">
                    <Link to={`/items/${item.id}`} onClick={handleClick}>
                        <img id="cardPhoto" src={item.photoUrl} alt="photo" />
                    </Link>
                </div>
                <div className="cardItemText">
                    <div className="cardLine">
                        <Link to={`/items/${item.id}`} onClick={handleClick}>
                            <div id="cardName" key="name">{item.name}</div>
                        </Link>
                        <span id="cardTypeText">class </span>
                        <Link to={`/category/${item.animalType}`}>
                            <span id="cardAnimalType" key="animalType">{item.animalType}</span>
                        </Link>
                    </div>
                    <div id="dc-rating-box">
                        <img id="dc-stars" src={pic} alt="rating" />
                        <div id="dc-review-text">({item.numReviews} {item.numReviews !== 1 ? "reviews" : "review"})</div>
                    </div>
                    <Price price={item.price}/>
                </div>
            </div>
        </>
    )

}

export default DisplayCard;
