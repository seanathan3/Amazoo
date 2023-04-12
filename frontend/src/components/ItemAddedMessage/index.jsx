import './itemAddedMessage.css';
import { useSelector } from 'react-redux';
import { calcTotalItems, calcSubtotal, formatPrice } from '../../utils/utils';

const ItemAddedMessage = () => {
    const cartItems = useSelector(state =>  Object.values(state.cartItems));

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
                            <span id="cartAddedTotal">{formatPrice(calcSubtotal(cartItems))}</span>
                            <span id="cartAddedZeroes">00</span>
                        </span>
                    </div>
                    <button id="" className="addToCartButton"></button>
                </div>
                <div className="verticalDivider" />
            </div>
        </>
    )

}

export default ItemAddedMessage;