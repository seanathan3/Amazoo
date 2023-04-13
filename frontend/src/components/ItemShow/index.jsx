import { useParams, Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchItem } from "../../store/itemReducer";
import Price from "../Price";
import AddItemForm from "../AddItemForm";
import './itemShow.css';
import rating6 from '../../assets/amazon-stars/amazon-stars-6.png';
import rating7 from '../../assets/amazon-stars/amazon-stars-7.png';
import rating8 from '../../assets/amazon-stars/amazon-stars-8.png';
import rating9 from '../../assets/amazon-stars/amazon-stars-9.png';
import rating10 from '../../assets/amazon-stars/amazon-stars-10.png';


const ItemShow = () => {
    const dispatch = useDispatch();
    let { itemId } = useParams();
    // itemId = parseInt(itemId)
    const item = useSelector(state => state?.items[itemId] ? state.items[itemId] : null)

    useEffect(() => {
        dispatch(fetchItem(itemId))
    }, [itemId, dispatch])

    function parseDescription(desc) {
        let output = desc.split('.')
        return output.slice(0, output.length - 1)
    }

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


    const descArr = item?.description ? parseDescription(item?.description) : []

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
                    
                    <img src={myRating} id="showRating" className="ratingsPic" />
                    <span id="showNumReviews" class="numReviews">{Math.floor(Math.random() * 250)}</span>


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






        </>
    )
}

export default ItemShow;