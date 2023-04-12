import './itemAddedMessage.css';
import { useSelector } from 'react-redux';
import { calcTotalItems, calcSubtotal, formatPrice } from '../../utils/utils';
import { useState } from 'react';
import { Redirect } from 'react-router-dom';

const ItemAddedMessage = () => {
    const cartItems = useSelector(state =>  Object.values(state.cartItems));
    const items = useSelector(state => Object.values(state.items))
    const [referrer, setReferrer] = useState(null);

    if (referrer) {
        return <Redirect to={referrer} />
    }

    return(
        <>
            <div id="itemAddedMaster">
                <div id="itemAddedProductCard">

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