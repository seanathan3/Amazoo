import { useSelector } from "react-redux"



const ProfileButton = () => {
    const currentUser = useSelector(state => state.session.user)


    
    return(
        <>
        </>
    )
}

export default ProfileButton