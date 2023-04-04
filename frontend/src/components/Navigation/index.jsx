import ProfileButton from './ProfileButton';
import './navigation.css';
import whiteLogo from '../../assets/amazoo_white.png'


const Navigation = () => {
    return (
        <>
            <div className="navBar">
                <div className="topNav">
                    <div className="logo">
                        <img className="logoPic" src={whiteLogo} alt="Pic" />
                    </div>
                    <ProfileButton />
                </div>

                <div className="bottomNav">
                    
                </div>

            </div>
        </>
    )
}

export default Navigation;