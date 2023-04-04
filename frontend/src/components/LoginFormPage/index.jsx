import { login } from "../../store/session"
import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import './LoginForm.css';
import blackLogo from '../../assets/amazoo_black.png'

const LoginFormPage = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user)

    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [errors, setErrors] = useState([])

    if (sessionUser) {
        return <Redirect to="/" />
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        setErrors([]);
        return dispatch(login({ email, password }))
          .catch(async (res) => {
            let data;
            try {
              // .clone() essentially allows you to read the response body twice
              data = await res.clone().json();
            } catch {
              data = await res.text(); // Will hit this case if the server is down
            }
            if (data?.errors) setErrors(data.errors);
            else if (data) setErrors([data]);
            else setErrors([res.statusText]);
          });
      }

      const submitDemoCreds = (e) => {
        e.preventDefault();
        return dispatch(login({ email: 'jakefarm@gmail.com', password: 'password' }))
      }
    

    return(
        <>
            <img className="blackLogo"src={blackLogo} alt="Amazoo" />
                <ul>
                    {errors.map((error, i) => {
                        return <li key={i}>{error}</li>
                    })}
                </ul>
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
        </>
    )
}


export default LoginFormPage