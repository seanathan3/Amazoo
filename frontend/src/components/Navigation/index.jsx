import ProfileButton from './ProfileButton';
import './navigation.css';
import whiteLogo from '../../assets/amazoo_white.png'
import { NavLink, Link } from 'react-router-dom';


const Navigation = () => {
    return (
        <>
            <div className="navBar">
                <div className="topNav">
                    <div className="logo">
                        <Link to="/">
                            <img className="logoPic" src={whiteLogo} alt="Pic" />
                        </Link>
                    </div>
                    <ProfileButton />
                </div>

                <div className="bottomNav">
                    <NavLink to="/all">All</NavLink>
                    <NavLink to="/category/ape">Ape</NavLink>
                    <NavLink to="/category/bird">Bird</NavLink>
                    <NavLink to="/category/bovine">Bovine</NavLink>
                    <NavLink to="/category/canine">Canine</NavLink>
                    <NavLink to="/category/dinosaur">Dinosaur</NavLink>
                    <NavLink to="/category/feline">Feline</NavLink>
                    <NavLink to="/category/insect">Insect</NavLink>
                    <NavLink to="/category/marsupial">Marsupial</NavLink>
                    <NavLink to="/category/rodent">Rodent</NavLink>
                    <NavLink to="/category/reptile">Reptile</NavLink>


                </div>

            </div>
        </>
    )
}

export default Navigation;