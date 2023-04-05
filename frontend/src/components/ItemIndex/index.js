import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux"
import { fetchItems } from "../../store/itemReducer";
import DisplayCard from "./DisplayCard";

const FormIndex = () => {
    const dispatch = useDispatch();
    const items = useSelector(state => Object.values(state.items));

    useEffect(() => {
        dispatch(fetchItems())
    }, [dispatch])



    return (
        <>
            <ul>
                {items.map(item => {
                    return <DisplayCard key={item.id} item={item} />
                })}
            </ul>
        </>
    )
}

export default FormIndex;