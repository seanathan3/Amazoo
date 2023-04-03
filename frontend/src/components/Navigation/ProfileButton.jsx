import { useSelector, useDispatch } from "react-redux"
import { useState, useEffect } from "react"
import { Link } from "react-router-dom"
import { logout } from "../../store/session"
import './navigation.css';



const ProfileButton = () => {
    const currentUser = useSelector(state => state.session.user)
    const [showMenu, setShowMenu] = useState(false);
    const [menuOptions, setMenuOptions] = useState([]);
    const dispatch = useDispatch();

    function handleClick(e) {
        setShowMenu(!showMenu)
    };

    function handleLogOut(e) {
        e.preventDefault();
        dispatch(logout());
    };

    useEffect(() => {
        if (!currentUser) {
            setMenuOptions([(
                <Link to="/login">Login</Link>
            ),
            (
                <Link to="/signup">Sign Up</Link>
            )

            ])
        } else {
            setMenuOptions([(
                <button onClick={handleLogOut}>Logout</button>
            )])
        }
    }, [showMenu, currentUser])


    return(
        <>
            <button className="profileMenu" onClick={handleClick}>
                <i className="fa-solid fa-user"></i>
            </button>

            {showMenu && (
                <ul>
                    {menuOptions.map((option, i) => {
                        return <li key={i}>{option}</li>
                    })}
                </ul>
            )}
        </>
    )
}

export default ProfileButton;