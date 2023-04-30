import { useEffect } from "react";
import { useSelector, useDispatch } from "react-redux"
import { fetchItems } from "../../store/itemReducer";
import DisplayCard from "./DisplayCard";
import './items.css'
import { useParams } from "react-router-dom";
import { fetchSelectItems } from "../../store/itemReducer";
import PageNotFound from "../PageNotFound";

const FormIndex = () => {
    const { categoryName } = useParams();
    const { query } = useParams();

    const dispatch = useDispatch();
    const items = useSelector(state => Object.values(state.items));

    useEffect(() => {
        if (query) {
            dispatch(fetchSelectItems(query))
        } else {
            dispatch(fetchItems())
        }
    }, [dispatch, query])

    function itemSelection() {
        if (categoryName) {

            let presence = items.some(item => {
                return item.animalType.toLowerCase() === categoryName.toLowerCase();
            });
            if (items.length !== 0 && !presence) return <PageNotFound search="true"/>

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

    if (items.length === 0 && query) {
        return (
            <>
                <div id="results">Results</div>
                <div id="itemIndexBackground">
                    <PageNotFound search="true"/>
                </div>
            </>
        )
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