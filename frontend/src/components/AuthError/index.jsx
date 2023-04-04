import './errors.css'
import Icon from '../../assets/red_ex_2.png'

const AuthError = ({message}) => {

    
    if (!message) {
        return null
    }
    return(
        <div className="errorContainer">
            <img src={Icon} alt="Icon" />
            <p className="error">{message}</p>
        </div>
    )
}

export default AuthError;