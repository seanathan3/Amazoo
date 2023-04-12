import { formatPrice } from "../../utils/utils";
import { deleteCartItem } from "../../store/cartItemReducer";
import { useDispatch, useSelector } from 'react-redux';
import { updateCartItem } from "../../store/cartItemReducer";
import { Link } from "react-router-dom";
import { useState } from "react";

const CheckoutCard = ({cartItem}) => {
    const dispatch = useDispatch();
    const item = useSelector(state => state.items[cartItem.itemId])
    const user = useSelector(state => state.session.user)
    const [quantity, setQuantity] = useState(cartItem.quantity)
    const [invalidInput, setInvalidInput] = useState(false);

    function handleUpdate(e) {
        const newCartItem = {
            ...cartItem,
            quantity: parseInt(e.target.value)
        };

        dispatch(updateCartItem(newCartItem))
    }

    function handleFieldUpdate(e) {
        e.preventDefault();
        const newCartItem = {
            ...cartItem,
            quantity: parseInt(quantity)
        }
        if (parseInt(quantity)) {

            setInvalidInput(false);
            dispatch(updateCartItem(newCartItem))
        } else {
            setInvalidInput(true);
        }
    }


    return (
        <>
            <div id="checkoutCardContainer">
                <div className="checkoutPicContainer">
                    <Link to={`/items/${cartItem.itemId}`}>
                        <img className="checkoutPic" src={item?.photoUrl} alt="checkoutPic" />
                    </Link>
                </div>
                <div className="checkoutCardDescription">
                    <Link className="subtleLink" to={`/items/${cartItem.itemId}`}>
                        <div className="cardDescName">{item?.name}</div>
                    </Link>
                    <div className="cardDescInStock">In Stock</div>
                    <div className="cardDescFreeShipping">eligible for FREE Shipping & <span>FREE Returns</span></div>
                    <div><span className="cardDescBold">Class: </span>{item?.animalType}</div>
                    <div className="cardDescToolbox">
                        <label htmlFor="quantity" className="checkoutQuantityLabel">Qty: &nbsp;</label>
                        {cartItem.quantity  <= 20 ? 
                        
                        <select defaultValue={cartItem.quantity} onChange={handleUpdate} name="qty" id="qty" className="cartFormSelect">
                            <option value={1}>1</option>
                            <option value={2}>2</option>
                            <option value={3}>3</option>
                            <option value={4}>4</option>
                            <option value={5}>5</option>
                            <option value={6}>6</option>
                            <option value={7}>7</option>
                            <option value={8}>8</option>
                            <option value={9}>9</option>
                            <option value={10}>10</option>
                            <option value={11}>11</option>
                            <option value={12}>12</option>
                            <option value={13}>13</option>
                            <option value={14}>14</option>
                            <option value={15}>15</option>
                            <option value={16}>16</option>
                            <option value={17}>17</option>
                            <option value={18}>18</option>
                            <option value={19}>19</option>
                            <option value={20}>20</option>
                            <option value={21}>20+</option>
                        </select>
                     :  
                            <form id="largeQuantForm" onSubmit={handleFieldUpdate}>
                                <input id="largeQuantInput" type="text" value={quantity} onChange={e => setQuantity(e.target.value)} />
                                <button id="largeQuantButton" className="addToCartButton">Update</button>
                            </form>
                     }
                        <div className="divider" />
                        <button className="checkoutDelete" onClick={() => dispatch(deleteCartItem(cartItem.id))}>Delete</button>
                    </div>
                    {invalidInput && (
                        <>
                            <div id="invalidInput">Invalid Input</div>
                        </>
                    )}
                </div>
                <div className="checkoutCardPrice">${formatPrice(item?.price)}.00</div>
            </div>
        </>
    )
}

export default CheckoutCard;