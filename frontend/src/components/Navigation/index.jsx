import ProfileButton from './ProfileButton';
import './navigation.css';


const Navigation = () => {
    return (
        <>
            <div className="navBar">
                <div className="topNav">
                    <div className="logo">Amazoo</div>
                    <ProfileButton />
                </div>

                <div className="bottomNav">
                    
                </div>

            </div>
        </>
    )
}

export default Navigation;