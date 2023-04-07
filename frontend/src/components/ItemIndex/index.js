import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux"
import { fetchItems } from "../../store/itemReducer";
import DisplayCard from "./DisplayCard";
import './items.css'
import { useParams } from "react-router-dom";

const FormIndex = ({category}) => {
    const { categoryName } = useParams();

    const dispatch = useDispatch();
    const items = useSelector(state => Object.values(state.items));

    useEffect(() => {
        dispatch(fetchItems())
    }, [dispatch])

    function itemSelection() {
        if (categoryName) {
            return (items.map(item => {
                if (item.animalType.toLowerCase() === categoryName.toLowerCase()) {
                    return <DisplayCard key={item.id} item={item} />
                }
            }))
        } else {
            return (items.map(item => {
                return <DisplayCard key={item.id} item={item} />
            }))
        }
    }


    return (
        <>
            <div id="results">Results</div>
            <div id="itemIndexBackground">
            {itemSelection()}
            </div>
        </>
    )
}

export default FormIndex;