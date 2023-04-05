import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux"
import { fetchItems } from "../../store/itemReducer";
import DisplayCard from "./DisplayCard";
import './items.css'

const FormIndex = () => {
    const dispatch = useDispatch();
    const items = useSelector(state => Object.values(state.items));

    useEffect(() => {
        dispatch(fetchItems())
    }, [dispatch])



    return (
        <>
            <div id="results">Results</div>
            <div id="itemIndexBackground">
                {items.map(item => {
                    return <DisplayCard key={item.id} item={item} />
                })}
            </div>
        </>
    )
}

export default FormIndex;