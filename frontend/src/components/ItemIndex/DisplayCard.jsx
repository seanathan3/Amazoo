import { Link } from 'react-router-dom';
import Price from '../Price';
import './items.css'
import rating6 from '../../assets/amazon-stars/amazon-stars-6.png';
import rating7 from '../../assets/amazon-stars/amazon-stars-7.png';
import rating8 from '../../assets/amazon-stars/amazon-stars-8.png';
import rating9 from '../../assets/amazon-stars/amazon-stars-9.png';
import rating10 from '../../assets/amazon-stars/amazon-stars-10.png';

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
                        <Link to={`/category/${item.animalType}`}>
                            <span id="cardAnimalType" key="animalType">{item.animalType}</span>
                        </Link>
                    </div>
                    <Price price={item.price}/>
                </div>
            </div>
        </>
    )

}

export default DisplayCard;
