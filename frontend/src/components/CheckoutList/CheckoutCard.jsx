import { formatPrice } from "../../utils/utils";

const CheckoutCard = ({cartItem}) => {
    
    return (
        <>
            <div id="checkoutCardContainer">
                <div className="checkoutPicContainer">
                    <img className="checkoutPic" src={cartItem.photoUrl} alt="cart item photo" />
                </div>
                <div className="checkoutCardDescription">
                    <div className="cardDescName">{cartItem.name}</div>
                    <div className="cardDescInStock">In Stock</div>
                    <div className="cardDescFreeShipping">eligible for FREE Shipping & <span>FREE Returns</span></div>
                    <div><span className="cardDescBold">Class: </span>{cartItem.type}</div>
                    <div><span className="cardDescBold">Qty: </span>{cartItem.quantity}</div>
                </div>
                <div className="checkoutCardPrice">${formatPrice(cartItem.price)}.00</div>
            </div>
        </>
    )
}

export default CheckoutCard;