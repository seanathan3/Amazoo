import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import { logout } from "../../store/session"
import { Modal } from "../../context/Modal"
import './navigation.css';

const ProfileButton = () => {
    const currentUser = useSelector(state => state.session.user)
    const [showMenu, setShowMenu] = useState(false);
    const [menuOptions, setMenuOptions] = useState([]);
    const [userText, setUserText] = useState('');
    const [showModal, setShowModal] = useState(false)

    const dispatch = useDispatch();

    function handleClick(e) {
        setShowModal(true)
    };

    function handleLogOut(e) {
        e.preventDefault();
        dispatch(logout());
        setShowMenu(false);
    };

    function closeMenu(e) {
        setShowMenu(false);
    }

    useEffect(() => {
        if (!currentUser) {
            setUserText('sign in')
            setMenuOptions([(
                <Link onClick={closeMenu} to="/login">Sign In</Link>
            ),
            (
                <Link onClick={closeMenu} to="/signup">Start here.</Link>
            )
            ])
        } else {
            // console.log(currentUser)
            setUserText(currentUser.name.split(' ')[0])
            setMenuOptions([(
                <button onClick={handleLogOut}>Logout</button>
            )])
        }
    }, [showMenu, currentUser])


    return(
        <>
        <div className="profileContainer">
            <button className="profileMenu" onClick={handleClick}>
                Hello, {userText}
            </button>
            {console.log(showModal)}

            {showModal && (
                // <ul className="profileMenuOptions">
                //     {menuOptions.map((option, i) => {
                //         return <li key={i}>{option}</li>
                //     })}
                // </ul>
                <Modal onClose={() => setShowModal(false)}>
                    <button className="authButton" id="signUpModalButton">{menuOptions[0]}</button>
                    <p className="signUpLink">New Customer? {menuOptions[1]} </p>
                </Modal>
            )}
        </div>
        </>
    )
}

export default ProfileButton;