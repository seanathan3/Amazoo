import { Link } from "react-router-dom";
import LoginFormPage from "../LoginFormPage";
import SignUpFormPage from "../SignUpFormPage";
import ProfileButton from './ProfileButton';

const Carrot = () => (
    <div style={{ color: "orange", fontSize: "100px" }}>
      <i className="fa-solid fa-carrot"></i>
    </div>
  );

const Navigation = ({currentUser}) => {
    let sessionLinks;
    if (currentUser) {
        sessionLinks = (
            <>
                <i className="fa-solid fa-user"></i>
                <Carrot />
            </>
        )
    } else {
        sessionLinks = (
            <>
                <Link to="/login">Sign In</Link>
                <br />
                <Link to="/signup">Sign Up</Link>
                <br />
            </>
        )
    }

    return (
        <>
            <div>
                {sessionLinks}
            </div>
            <ProfileButton />
        </>
    )
}

export default Navigation;