import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import { logout } from "../../store/sessionReducer"
import { Modal } from "../../context/Modal"
import './navigation.css';

const ProfileButton = () => {
    const currentUser = useSelector(state => state.session.user)
    const [showMenu, setShowMenu] = useState(false);
    const [menuOptions, setMenuOptions] = useState([]);
    const [userText, setUserText] = useState('');
    const [showModal, setShowModal] = useState(false);
    const [enteredModal, setEnteredModal] = useState(false);

    const dispatch = useDispatch();

    function handleClick(e) {
        setShowModal(true)
    };

    function handleLogOut(e) {
        e.preventDefault();
        dispatch(logout());
        setShowModal(false);
    };

    function closeMenu(e) {
        setShowMenu(false);
    }

    useEffect(() => {

        if (!currentUser) {
            setUserText('sign in')
            setMenuOptions([(
                <Link key="1" id="loginButtonLink" onClick={closeMenu} to="/login">
                    <button className="authButton" id="signInModalButton">Sign In</button>
                </Link>
            ),
            (
                <p key="2" className="signUpLink">New Customer?&nbsp;
                    <Link id="signUpButtonLink" onClick={closeMenu} to="/signup">Start here.</Link>
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

        let box = document.getElementsByClassName('profileMenu')[0];

        if (showModal) {
            let modalContent = document.getElementById('modal-content')
            let myModal = document.getElementById('modal')
            modalContent.addEventListener('mouseleave', e => {
                setShowModal(false);
            })

            modalContent.addEventListener('mouseenter', e => {
                setEnteredModal(true)
                console.log(enteredModal)
                console.log('myContent')
            })

            // myModal.addEventListener('mouseenter', e => {
            //     console.log('myModal')
            //     if (setEnteredModal) {
            //         setShowModal(false);
            //         setEnteredModal(false);
            //     }
            // })
        }

        box.addEventListener('mouseover', e => {
            setShowModal(true);
        })

        document.addEventListener('click', e => {
            setShowModal(false);
        })

    

    }, [showModal, currentUser])


    return(
        <>
        <div className="profileContainer">
            <button className="profileMenu" onClick={handleClick}>
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