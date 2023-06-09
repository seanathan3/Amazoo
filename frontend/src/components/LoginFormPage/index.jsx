import { login } from "../../store/sessionReducer"
import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect, Link } from "react-router-dom";
import './LoginForm.css';
import blackLogo from '../../assets/amazoo_black.png'
import alert from '../../assets/alert.png'

const LoginFormPage = ({redirecting}) => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user)

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [error, setError] = useState('')

    if (sessionUser) {
        if (redirecting) {
            return <Redirect to="/" />
        } else {
            return <Redirect to="/" />
        }
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        setError('')
        return dispatch(login({ email, password }))
          .catch(async (res) => {
            setError('Your credentials are incorrect')
          });
      }

      const submitDemoCreds = (e) => {
        e.preventDefault();
        return dispatch(login({ email: 'jakefarm@gmail.com', password: 'password' }))
      }
    

    return(
        <>
            <Link to="/">
                <img className="blackLogo"src={blackLogo} alt="Amazoo" />
            </Link>

            {error ? (
                <>
                    <div className="loginErrorBox">
                        <img className="alertPic" src={alert} alt="alert" />
                        <div className="errorBoxText">
                            <p id="redErrorText">There was a problem</p>
                            <p id="loginError">{error}</p>
                        </div>
                    </div>
                </>
            ) : null }

            <form id="loginForm" >
                <div className="formHeader">
                    <h2>Sign in</h2>
                </div>
                
                <div className="formItem">
                    <label className="fieldLabel">Email</label>
                    <input className="fieldInput" type="text" value={email} onChange={e => setEmail(e.target.value)}/>
                </div>

                <div className="formItem">
                    <label className="fieldLabel">Password</label>
                    <input className="fieldInput" type="password" value={password} onChange={e => setPassword(e.target.value)}/>
                </div>
            
                <button onClick={handleSubmit} className="authButton" id="formLogInButton">Sign In</button>

                <button onClick={submitDemoCreds} className="authButton" id="demoLogin">Demo User</button>

                <p className="terms">By continuing, you agree to Amazoo's Conditions of Use and Privacy Notice.</p>
            </form>

            <p id="newToAmazon">New to Amazoo?</p>

            <Link to="/signup">
                <button className="authButton" id="grayButton">Create your Amazoo Account</button>
            </Link>
        </>
    )
}


export default LoginFormPage