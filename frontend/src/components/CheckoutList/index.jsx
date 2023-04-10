import { useEffect, useState } from "react";
import { fetchCartItems } from "../../store/cartItemReducer";
import { useDispatch, useSelector } from "react-redux";
import './checkoutList.css'
import CheckoutCard from "./CheckoutCard";

const CheckoutList = () => {
    const dispatch = useDispatch();
    const userId = useSelector(state => state.session.user.id)
    const cartItems = useSelector(state => Object.values(state.cartItems))
    const [subtotal, setSubtotal] = useState(0)

    useEffect(() => {
        dispatch(fetchCartItems(userId))
    }, [userId])

    return (
        <>
            <div id="checkoutListMaster">
                <div id="checkoutListItems">
                    <div className="checkoutListItemsHeader">
                        <div id="shoppingCartText">Shopping Cart</div>
                        <div id="shoppingCartPrice">Price</div>
                    </div>
                    {cartItems.map(cartItem => {
                        return (
                        <>
                            <div className="checkoutListDivider" />
                            <CheckoutCard cartItem={cartItem}/>
                        </>

                        )
                    })}
                </div>
            </div>
        </>
    )
}

export default CheckoutList;