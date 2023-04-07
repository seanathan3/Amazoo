import { useParams } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { useEffect } from "react";
import { fetchItem } from "../../store/itemReducer";

const ItemPage = () => {
    const dispatch = useDispatch();
    let { itemId } = useParams();
    // itemId = parseInt(itemId)
    const item = useSelector(state => state?.items[itemId] ? state.items[itemId] : null)
    console.log(item)

    useEffect(() => {
        dispatch(fetchItem(itemId))
    }, [itemId])



    return (
        <>
            <p>{item?.name}</p>
            <img src={item?.photoUrl} alt="image" />
            <p>{item?.animalType}</p>
            <p>{item?.price}</p>
            <p>{item?.description}</p>
        </>
    )
}

export default ItemPage;