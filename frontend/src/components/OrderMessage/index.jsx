import { useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { removeAllCartItems } from "../../store/cartItemReducer";
import { useParams } from "react-router-dom";

const OrderMessage = () => {
    const user = useSelector(state => state?.session?.user)
    const { count } = useParams();

    return(
        <div id="orderMessageContainer">
            <div id="orderMessageIcon">

            </div>
            <div id="orderMessageContent">
                <div id="orderMessageContentHeader">
                    Thank you, your order has been placed
                </div>
                <div>
                    An email confirmation has <span>not</span> been sent to you.
                </div>
                <div className="bold">
                    Order Number: {Math.floor(10000 * Math.random())}
                </div>
                <div>
                {count} items will be shipped to {user?.name} by Amazoo.com.
                </div>
                <div className="bold">
                    Guaranteed delivery: <span className="green">Jan. 12, 2054</span>
                </div>
            </div>

        </div>
    )

}

export default OrderMessage;