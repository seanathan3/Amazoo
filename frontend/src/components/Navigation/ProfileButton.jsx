import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import { logout } from "../../store/session"
import './navigation.css';

const ProfileButton = () => {
    const currentUser = useSelector(state => state.session.user)
    const [showMenu, setShowMenu] = useState(false);
    const [menuOptions, setMenuOptions] = useState([]);
    const [userText, setUserText] = useState('');

    const dispatch = useDispatch();

    function handleClick(e) {
        setShowMenu(!showMenu)
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
                <Link onClick={closeMenu} to="/login">Login</Link>
            ),
            (
                <Link onClick={closeMenu} to="/signup">Sign Up</Link>
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

            {showMenu && (
                <ul className="profileMenuOptions">
                    {menuOptions.map((option, i) => {
                        return <li key={i}>{option}</li>
                    })}
                </ul>
            )}
        </div>
        </>
    )
}

export default ProfileButton;