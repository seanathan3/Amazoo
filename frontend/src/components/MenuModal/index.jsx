import { Modal } from "../../context/Modal";
import { useState } from "react";
import LoginFormPage from '../LoginFormPage'

function MenuModal () {
    const [showModal, setShowModal] = useState(false);

    return (
        <>
            <button onClick={() => setShowModal(true)}>Modal</button>
            {showModal && (
                <Modal onClose={() => setShowModal(false)}>
                    <h1>Arielito</h1>
                </Modal>
      )}
        </>
    )
}

export default MenuModal;