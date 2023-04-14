import { useEffect, useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { removeAllCartItems } from "../../store/cartItemReducer";
import { Redirect, useParams } from "react-router-dom";
import './orderMessage.css';
import githubLogo from '../../assets/github-mark.png';
import linkedInLogo from '../../assets/linked-in.png';

const OrderMessage = () => {
    const user = useSelector(state => state?.session?.user)
    const { count } = useParams();
    const [referrer, setReferrer] = useState(false);

    if (referrer) {
        return <Redirect to="/" />
    }

    const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sept',
        'Oct',
        'Nov',
        'Dec'
    ]

    return(
        <div id="orderMessageBackground">
            <div id="orderMessageContainer">
                <div id="orderMessageContent">
                    <div id="orderMessageFirstLine">
                        <div id="checkIcon" style={{color: 'green', fontSize: '18px'}} >
                            <i className="fa-solid fa-circle-check"></i>
                        </div>
                        <div id="orderMessageContentHeader">
                            Order placed, thanks!
                        </div>
                    </div>
                    <div id="confirmation">
                        Confirmation will <span className="bold">not</span> be sent to your email.
                    </div>
                    <div>
                        {count} {count !== 1 ? "item" : "items"} will be shipped to {user?.name} by Amazoo.com.
                    </div>
                    <div className="horizontalDivider" />
                    <div className="bold">
                        Order Number: {10000 + Math.floor(90000 * Math.random())}
                    </div>
                    <div className="bold">
                        Guaranteed delivery: <span className="green">{months[Math.floor(Math.random() * months.length)]}. {1 + Math.floor(Math.random() * 28)}, {2050 + (Math.floor(Math.random() * 50))}</span>
                    </div>
                </div>
            </div>
            <div id="orderMessageBackHome">
                <button onClick={() => setReferrer(true)}id="orderMessageButton" className="addToCartButton">Home</button>
            </div>
            <div id="otherProjects">
                <div id="otherProjectsHeader">
                    Check out my other projects!
                </div>
                <div id="otherAboutLink">
                        <div id="otherGithubIcon" className="aboutLinkContainer">
                            <a href="https://github.com/sean-a99/Amazoo" target="_blank">
                                <img className="aboutLink" src={githubLogo} alt="github" />
                            </a>
                        </div>
                        <div id="otherLinkedInIcon" className="aboutLinkContainer">
                            <a href="https://www.linkedin.com/in/sean-abbas/" target="_blank">
                                <img className="aboutLink" src={linkedInLogo} alt="linkedin" />
                            </a>
                        </div>
                </div>
            </div>
        </div>
    )

}

export default OrderMessage;