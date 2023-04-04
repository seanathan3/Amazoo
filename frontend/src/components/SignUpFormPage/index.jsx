import { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { signUp } from "../../store/session";
import { Redirect } from "react-router-dom";
import blackLogo from '../../assets/amazoo_black.png'
import AuthError from "../AuthError";


const SignUpFormPage = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user)
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPass, setConfirmPass] = useState('');
    const [errors, setErrors] = useState([]);
    const [messages, setMessages] = useState({})

    if (sessionUser) return <Redirect to="/" />

    function handleSubmit(e) {
        e.preventDefault();
        let user = { name, email, password }
        if (password === confirmPass) {
            return dispatch(signUp(user))
                .catch( async (res) => {
                    let data;
                    try {
                        data = await res.clone().json();
                    } catch {
                        data = await res.text();
                    }
                    if (data?.errors) setErrors(data.errors);
                    else if (data) setErrors([data]);
                    else setErrors([res.statusText]);
                });
        }
        setErrors(errors.concat(['Passwords must match']))

    }

    return (
        <>
            <img className="blackLogo"src={blackLogo} alt="Amazoo" />

            <form id="signUpForm" onSubmit={handleSubmit}>
                <div className="formHeader">
                    <h2>Create account</h2>
                </div>


                <div className="formItem">
                    <label className="fieldLabel">Your Name</label>
                    <input className="fieldInput" type="text" placeholder="First and last name" value={name} onChange={e => setName(e.target.value)}/>
                </div>

                {errors.includes("Name can't be blank") ? 
                <AuthError message={'Name error'}/> : null
                }

                <div className="formItem">
                    <label className="fieldLabel">Email</label>
                    <input className="fieldInput" type="text" value={email} onChange={e => setEmail(e.target.value)}/>
                </div>

                {errors.includes("Email is too short (minimum is 3 characters)") || 
                errors.includes("Email is invalid") ? 
                <AuthError message={'Wrong or Invalid email address or mobile phone number. Please correct and try again.'}/> : null
                }

                <div className="formItem">
                    <label className="fieldLabel">Password</label>
                    <input className="fieldInput" type="password" placeholder="At least 6 characters" value={password} onChange={e => setPassword(e.target.value)}/>
                </div>


                {errors.includes("Password is too short (minimum is 6 characters)") || 
                errors.includes("Password can't be blank") ? 
                <AuthError message={'Minimum 6 characters required'}/> : null
                }

                <div className="formItem">
                    <label className="fieldLabel">Re-enter password</label>
                    <input className="fieldInput" type="password" value={confirmPass} onChange={e => setConfirmPass(e.target.value)}/>
                </div>
                
                {errors.includes("Passwords must match") ? 
                <AuthError message={'Passwords must match'}/> : null
                }
                

                <button id="formSignUpButton"className="authButton">Sign Up</button>

                <p className="terms">By creating an account, you agree to Amazoo's Conditions of Use and Privacy Notice.</p>
            </form>
        </>
    )
}

export default SignUpFormPage;