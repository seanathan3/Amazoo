

const CheckoutCard = ({cartItem}) => {
    
    return (
        <>
            <div id="checkoutCardContainer">
                <img className="checkoutPic" src={cartItem.photoUrl} alt="cart item photo" />
                <div className="checkoutCardDescription">
                    <div>{cartItem.name}</div>
                    <div>In Stock</div>
                    <div>eligible for FREE Shipping & <span>FREE Returns</span></div>
                    <div><span>Class: </span>{cartItem.type}</div>
                    <div><span>Qty: </span>{cartItem.quantity}</div>
                </div>
                <div id="checkoutCardPrice">${cartItem.price}</div>
            </div>
        </>
    )
}

export default CheckoutCard;