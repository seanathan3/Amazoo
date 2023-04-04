import './errors.css'

const AuthError = ({message}) => {

    
    if (!message) {
        return null
    }
    return(
        <li className="error">{message}</li>
    )
}

export default AuthError;