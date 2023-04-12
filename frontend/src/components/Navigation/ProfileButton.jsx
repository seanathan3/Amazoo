import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import { Link, useHistory } from "react-router-dom"
import { logout } from "../../store/sessionReducer"
import { removeAllCartItems } from "../../store/cartItemReducer"
import { Modal } from "../../context/Modal"
import './navigation.css';

const ProfileButton = () => {
    const history = useHistory();
    const currentUser = useSelector(state => state.session.user)
    const [menuOptions, setMenuOptions] = useState([]);
    const [userText, setUserText] = useState('');
    const [showModal, setShowModal] = useState(false);

    const dispatch = useDispatch();

    let timer = null;

    function handleClick(e) {
        setShowModal(true)
    };

    function handleLogOut(e) {
        e.preventDefault();
        dispatch(removeAllCartItems())
        dispatch(logout());
        setShowModal(false);
        setTimeout(e => {
            history.push('/login')
        }, 100)
    };



    useEffect(() => {

        if (!currentUser) {
            setUserText('sign in')
            setMenuOptions([(
                <Link key="1" id="loginButtonLink" to="/login">
                    <button className="authButton" id="signInModalButton">Sign In</button>
                </Link>
            ),
            (
                <p key="2" className="signUpLink">New Customer?&nbsp;
                    <Link id="signUpButtonLink" to="/signup">Start here.</Link>
                </p>
            )
            ])
        } else {
            setUserText(currentUser.name.split(' ')[0])
            setMenuOptions([(
                <Link key='1' className="logoutLink" onClick={handleLogOut} to="/">
                    <button id="logoutButton" className="authButton">Logout</button>
                </Link>
            )])
        }

        // let box = document.getElementsByClassName('profileMenu')[0];

        if (showModal) {
            let modalContent = document.getElementById('modal-content')
            modalContent.addEventListener('mouseleave', e => {
                timer = setTimeout(() => setShowModal(false), 500);
                // setShowModal(false);
            })
            
            modalContent.addEventListener('mouseenter', e => {
                if (timer) clearTimeout(timer);
                setShowModal(true);
            })
        }

        // box.addEventListener('mouseover', e => {
        //     setShowModal(true);
        // })

        document.addEventListener('click', e => {
            setShowModal(false);
        })

    

    }, [showModal, currentUser])


    return(
        <>
        <div className="profileContainer">
            <button 
                className="profileMenu" 
                onClick={handleClick}
                onMouseEnter={() => setShowModal(true)}
                onMouseLeave={(e) => setShowModal(false)}
                >
                Hello, {userText} <br />
                <span id="boldProfileText">Account & Lists </span>
                <span style={{ color: "gray" }}>
                    <i className="fa-sharp fa-solid fa-caret-up fa-rotate-180"></i>
                </span>
                
            </button>
            
            {showModal && (
                <Modal onClose={() => setShowModal(false)}>
                    {menuOptions.map(option => {
                        return option
                    })}
                </Modal>
            )}
        </div>
        </>
    )
}

export default ProfileButton;