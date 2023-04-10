import { Link } from 'react-router-dom';
import './navigation.css';
import cartIcon from '../../assets/cart.png'

const CartButton = () => {
    

    return (
        <>
            <Link to="/checkout" id="cartButtonLink">
                <div id="cartButtonContainer">
                    <img id="cartButtonPic" src={cartIcon} alt="cartIcon" />
                    <p id="cartButtonText">Cart</p>
                    <div id="cartButtonQuantity">6</div>
                </div>
            </Link>
        </>
    )
}

export default CartButton;