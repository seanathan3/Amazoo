import { useRef, useContext, useState, useEffect, createContext } from "react";
import { createPortal } from "react-dom";
import './Modal.css'

const ModalContext = createContext();

export const ModalProvider = ({children}) => {
    const modalRef = useRef();
    const [value, setValue] = useState();

    useEffect(() => {
        setValue(modalRef.current);
    }, [])

    return (
        <>
            <ModalContext.Provider value={value}>
                {children}
            </ModalContext.Provider>
            <div ref={modalRef}/>
        </>
    );
}

export function Modal({ onClose, children }) {
    const modalNode = useContext(ModalContext);
    if (!modalNode) return null;
  
    return createPortal(
      <div id="modal">
        <div id="modal-background" onClick={onClose} />
        <div id="modal-content">
          {children}
        </div>
      </div>,
      modalNode
    );
  }

