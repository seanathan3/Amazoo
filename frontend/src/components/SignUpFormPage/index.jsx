import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { signUp } from "../../store/session";
import { Redirect } from "react-router-dom";

const SignUpFormPage = () => {
    const dispatch = useDispatch();
    const sessionUser = useSelector(state => state.session.user)
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    const [confirmPass, setConfirmPass] = useState('');
    const [errors, setErrors] = useState([]);

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
        return setErrors(['Passwords must match'])
    }

    return (
        <>
            <ul>
                {errors.map((error, i) => {
                    return <li key={i}>{error}</li>
                })}
            </ul>

            <form onSubmit={handleSubmit}>
                <div className="formHeader">
                    <h2>Create Account</h2>
                </div>


                <div className="formItem">
                    <label className="fieldLabel">Your Name</label>
                    <input className="fieldInput" type="text" value={name} onChange={e => setName(e.target.value)}/>
                </div>

                <div className="formItem">
                    <label className="fieldLabel">Email</label>
                    <input className="fieldInput" type="text" value={email} onChange={e => setEmail(e.target.value)}/>
                </div>

                <div className="formItem">
                    <label className="fieldLabel">Password</label>
                    <input className="fieldInput" type="password" value={password} onChange={e => setPassword(e.target.value)}/>
                </div>
                
                <div className="formItem">
                    <label className="fieldLabel">Re-enter password</label>
                    <input className="fieldInput" type="password" value={confirmPass} onChange={e => setConfirmPass(e.target.value)}/>
                </div>
                
                <button className="authButton">Continue</button>
            </form>
        </>
    )
}

export default SignUpFormPage;