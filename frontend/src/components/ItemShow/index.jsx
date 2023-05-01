import { useParams, Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchItem } from "../../store/itemReducer";
import Price from "../Price";
import AddItemForm from "../AddItemForm";
import './itemShow.css';
import PageNotFound from "../PageNotFound";
import ReviewIndex from "../ReviewIndex";


const ItemShow = () => {
    const dispatch = useDispatch();
    let { itemId } = useParams();
    // itemId = parseInt(itemId)
    const item = useSelector(state => state?.items[itemId] ? state.items[itemId] : null)

    useEffect(() => {
        dispatch(fetchItem(itemId));
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

            <ReviewIndex itemId={itemId} />





        </>
    )
}

export default ItemShow;