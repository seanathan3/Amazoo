import './itemAddedMessage.css';
import { useDispatch, useSelector } from 'react-redux';
import { calcTotalItems, calcSubtotal, formatPrice } from '../../utils/utils';
import { useState } from 'react';
import { Redirect, useParams } from 'react-router-dom';
import { useEffect } from 'react';
import { fetchCartItems } from '../../store/cartItemReducer';
import { fetchItems } from '../../store/itemReducer';

const ItemAddedMessage = () => {
    const cartItems = useSelector(state =>  Object.values(state.cartItems));
    const dispatch = useDispatch();
    const items = useSelector(state => Object.values(state.items))
    const [referrer, setReferrer] = useState(null);
    const { itemId } = useParams();
    const addedItem = useSelector(state => state.items[itemId])
    const userId = useSelector(state => state?.session?.user?.id)

    useEffect(() => {
        if (userId) {
            dispatch(fetchCartItems(userId))
        }
        dispatch(fetchItems())
    }, [itemId, userId])

    if (referrer) {
        return <Redirect to={referrer} />
    }

    return(
        <>
            <div id="itemAddedMaster">

                <div id="itemAddedProductCard">
                    <img src={addedItem?.photoUrl} alt="animal-pic" />

                    <div id="productCartText">
                        <div id="itemAddedToCart">
                            <div id="checkIcon" style={{color: 'green', fontSize: '18px'}} >
                                <i className="fa-solid fa-circle-check"></i>
                            </div>
                            <div id="addedToCartCardText">Added to Cart</div>
                        </div>
                        <div><span className="bold">Name: </span>{addedItem?.name}</div>
                        <div><span className="bold">Type: </span>{addedItem?.animalType}</div>
                    </div>
                
                </div>

                <div id="itemAddedShippingCard">
                    <div className="green">
                        Your order qualiifies for FREE Shipping.
                    </div>
                    <div>Choose this option at checkout.</div>
                </div>
                <div id="itemAddedCartCard">
                    <div id="itemAddedSubtotal">
                        <span className="bold">Cart Subtotal: </span> 
                        <span>
                            <span id="cartAddedPriceSymbol">$</span>
                            <span id="cartAddedTotal">{formatPrice(calcSubtotal(cartItems, items))}</span>
                            <span id="cartAddedZeroes">00</span>
                        </span>
                    </div>
                    <button onClick={() => setReferrer('/checkout')} id="itemAddedCartButton" className="addToCartButton">Proceed to checkout ({calcTotalItems(cartItems)} items)</button>
                    <button onClick={() => setReferrer('/')}id="itemAddedHomeButton" className="addToCartButton">Go to Home</button>
                </div>
                <div className="verticalDivider" />
            </div>
        </>
    )

}

export default ItemAddedMessage;