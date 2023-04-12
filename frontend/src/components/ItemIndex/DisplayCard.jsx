import { Link } from 'react-router-dom';
import Price from '../Price';
import './items.css'

const DisplayCard = ({item}) => {

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
                        <Link to={`category/${item.animalType}`}>
                            <span id="cardAnimalType" key="animalType">{item.animalType}</span>
                        </Link>
                    </div>
                    <p id="cardReviews" className="cardLine">Reviews Placeholder</p>
                    <Price price={item.price}/>
                </div>
            </div>
        </>
    )

}

export default DisplayCard;
