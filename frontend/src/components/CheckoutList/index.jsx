import React, { useEffect, useState } from "react";
import { fetchCartItems } from "../../store/cartItemReducer";
import { useDispatch, useSelector } from "react-redux";
import './checkoutList.css'
import CheckoutCard from "./CheckoutCard";
import { formatPrice } from "../../utils/utils";
import { Redirect } from "react-router-dom";
import { deleteCartItem } from "../../store/cartItemReducer";
import { calcTotalItems } from "../../utils/utils";
import { calcSubtotal } from "../../utils/utils";
import { fetchItems } from "../../store/itemReducer";
import sleepingPuppy from '../../assets/dog-sleeping.png'

const CheckoutList = () => {
    const dispatch = useDispatch();
    const userId = useSelector(state => state?.session?.user?.id)
    const cartItems = useSelector(state => Object.values(state.cartItems))
    const items = useSelector(state => Object.values(state.items))
    const [referrer, setReferrer] = useState(false)

    useEffect(() => {
        dispatch(fetchItems())
        if (userId) {
            dispatch(fetchCartItems(userId))
            calcSubtotal();
        }
    }, [userId, dispatch])

    function handleClick(e) {
        e.preventDefault();

        if (userId) {
            (calcTotalItems(cartItems))
            let num = calcTotalItems(cartItems)
            let ids = cartItems.map(cartItem => {
                return cartItem.id
            })
            ids.forEach(id => {
                dispatch(deleteCartItem(id))
            })
            setReferrer(`/orderMessage/${num}`)
        } else {
            setReferrer('/login')
        }
    }

    if (cartItems.length === 0) {
        return (
            <>
                <div id="checkoutListMasterFixed">
                    <div id="checkoutListItems2">
                        <div id="emptyCartMsg">Your Amazoo Cart is empty</div>
                        <img id="fox" src={sleepingPuppy} alt="dog" />
                    </div>
                </div>
            </>
        )
    }

    if (referrer) {
        return <Redirect to={referrer} />
    }

    return (
        <>
            <div id={cartItems.length > 1 ? "checkoutListMaster" : "checkoutListMasterFixed"}>
                <div id="checkoutListItemsContainer">

                    <div id="checkoutListItems">
                        <div className="checkoutListItemsHeader">
                            <div id="shoppingCartText">Shopping Cart</div>
                            <div id="shoppingCartPrice">Price</div>
                        </div>
                        {cartItems.map((cartItem) => {
                            return (
                                <React.Fragment key={cartItem.id}>
                                    <div className="checkoutListDivider" />
                                    <CheckoutCard cartItem={cartItem}/>
                                </React.Fragment>
                            )
                        })}
                        <div className="checkoutListDivider" />

                        <div id="subtotalContainer">
                            Subtotal: 
                            ({calcTotalItems(cartItems)} items): &nbsp;

                            <span className="bold">
                                ${formatPrice(calcSubtotal(cartItems, items))}.00
                            </span>
                        </div>
                    </div>
                    <div id="whiteBox" />
                    <p id="checkoutTerms">The price and availability of items at Amazoo are subject to change. The Cart is a temporary place to store a list of your items and reflects each item's most recent price. Do you have a gift card or promotional code? We'll ask you to enter your claim code when it's time to pay.</p>
                </div>
                <div id="purchaseCard">
                    <div id="checkoutFreeShipping">
                        <div id="checkIcon" style={{color: 'green', fontSize: '18px'}} >
                            <i className="fa-solid fa-circle-check"></i>
                        </div>
                        <div id="purchaseCardText">
                            <span className="green">Your order qualifies for FREE Shipping.</span>Choose this option at checkout.
                        </div>
                    </div>
                    <div id="purchaseSubtotal">
                        Subtotal: 
                        ({calcTotalItems(cartItems)} items):

                        <div className="bold">
                            ${formatPrice(calcSubtotal(cartItems, items))}.00

                        </div>
                    </div>
                    <button onClick={handleClick} className="addToCartButton" id="finalCheckoutButton">Place your order</button>
                </div>

            </div>
        </>
    )
}

export default CheckoutList;