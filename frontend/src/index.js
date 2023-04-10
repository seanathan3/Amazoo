import React from 'react';
import './reset.css'
import './index.css';
import App from './App';
import ReactDOMClient from 'react-dom/client';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import configureStore from './store';
import csrfFetch from './store/csrf';
import * as sessionActions from './store/sessionReducer';
import * as itemActions from './store/itemReducer'
import * as cartItemActions from './store/cartItemReducer'
import { restoreSession } from './store/sessionReducer';
import { ModalProvider } from './context/Modal';

const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
  window.itemActions = itemActions;
  window.cartItemActions = cartItemActions;
}

const root = ReactDOMClient.createRoot(document.getElementById('root'));


const renderApp = () => {
  root.render(
    <ModalProvider>
      <React.StrictMode>
        <Provider store={store}>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </Provider>
      </React.StrictMode>
    </ModalProvider>
  )
}

if (sessionStorage.getItem('X-CSRF-Token') === null ||
    sessionStorage.getItem('currentUser') === null) {
  store.dispatch(restoreSession()).then(renderApp);
} else {
  renderApp();
}

