import ProfileButton from './ProfileButton';
import './navigation.css';
import { NavLink, Link } from 'react-router-dom';
import whiteLogo from '../../assets/amazoo_white.png'
import CartButton from './CartButton';
import SearchBar from '../SearchBar';
import githubLogo from '../../assets/github-white.png';
import linkedInLogo from '../../assets/linked-in.png'

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
                    <SearchBar />
                    <div id="rightNavLinks">
                        <div id="githubIcon" className="aboutLinkContainer">
                            <a href="https://github.com/sean-a99/Amazoo" target="_blank">
                                <img className="aboutLink" src={githubLogo} alt="github" />
                            </a>
                        </div>
                        <div id="linkedInIcon" className="aboutLinkContainer">
                            <a href="https://www.linkedin.com/in/sean-abbas/" target="_blank">
                                <img className="aboutLink" src={linkedInLogo} alt="linkedin" />
                            </a>
                        </div>
                        <ProfileButton />
                        <CartButton />
                    </div>
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