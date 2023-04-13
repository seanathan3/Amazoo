import { Link } from 'react-router-dom';
import Price from '../Price';
import './items.css'
import rating6 from '../../assets/amazon-stars/amazon-stars-6.png';
import rating7 from '../../assets/amazon-stars/amazon-stars-7.png';
import rating8 from '../../assets/amazon-stars/amazon-stars-8.png';
import rating9 from '../../assets/amazon-stars/amazon-stars-9.png';
import rating10 from '../../assets/amazon-stars/amazon-stars-10.png';

const DisplayCard = ({item}) => {

    let myRating = 0
    if (item?.rating === 10) {
        myRating = rating10;
    } else if (item?.rating === 9) {
        myRating = rating9;
    } else if (item?.rating === 8) {
        myRating = rating8;
    } else if (item?.rating === 7) {
        myRating = rating7;
    } else {
        myRating = rating6;
    }

    return (
        <>
            <div className="card">
                <div className="cardItemImageBox">
                    <Link to={`/items/${item.id}`}>
                        <img id="cardPhoto" src={item.photoUrl} alt="photo" />
                    </Link>
                </div>
                <div className="cardItemText">
                    <div className="cardLine">
                        <Link to={`/items/${item.id}`}>
                            <div id="cardName" key="name">{item.name}</div>
                        </Link>
                        <span id="cardTypeText">class </span>
                        <Link to={`/category/${item.animalType}`}>
                            <span id="cardAnimalType" key="animalType">{item.animalType}</span>
                        </Link>
                    </div>
                    <img src={myRating} className="ratingsPic" />
                    <span class="numReviews">{Math.floor(Math.random() * 250)}</span>
                    <Price price={item.price}/>
                </div>
            </div>
        </>
    )

}

export default DisplayCard;
