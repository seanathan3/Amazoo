import ProfileButton from './ProfileButton';
import './navigation.css';
import Logo from '../../assets/amazoo_white_final.png'


const Navigation = () => {
    return (
        <>
            <div className="navBar">
                <div className="topNav">
                    <div className="logo">
                        <img src={Logo} alt="Pic" />
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