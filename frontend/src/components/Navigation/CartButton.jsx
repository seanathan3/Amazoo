import { Link } from 'react-router-dom';
import './navigation.css';
import cartIcon from '../../assets/cart.png'
import { useDispatch, useSelector } from 'react-redux';
import { useEffect } from 'react';
import { fetchCartItems } from '../../store/cartItemReducer';

const CartButton = () => {
    const dispatch = useDispatch();
    const cartItems = useSelector(state => Object.values(state.cartItems));
    const userId = useSelector(state => state?.session?.user?.id)


    useEffect(() => {
        if (userId) {
            dispatch(fetchCartItems(userId));
        }
    }, [userId, dispatch])

    function calcTotalItems(cartItemsArr) {
        let output = 0;
        for (let i = 0; i < cartItemsArr.length; i++) {
            output += cartItemsArr[i].quantity
        }
        return output
    }

    return (
        <>
            <Link to="/checkout" id="cartButtonLink">
                <div id="cartButtonContainer">
                    <img id="cartButtonPic" src={cartIcon} alt="cartIcon" />
                    <p id="cartButtonText">Cart</p>
                    <div id="cartButtonQuantity">{calcTotalItems(cartItems)}</div>
                </div>
            </Link>
        </>
    )
}

export default CartButton;