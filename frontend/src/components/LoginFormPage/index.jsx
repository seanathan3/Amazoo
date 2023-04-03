import { login } from "../../store/session"
import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { Redirect } from "react-router-dom";
import './LoginForm.css';

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
    

    return(
        <>
                <div className="formLogo">Amazoo</div>
                <ul>
                    {errors.map((error, i) => {
                        return <li key={i}>{error}</li>
                    })}
                </ul>
            <form onSubmit={handleSubmit}>
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
            
                <button>Sign In</button>
            </form>
        </>
    )
}


export default LoginFormPage