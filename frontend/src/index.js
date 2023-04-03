import React from 'react';
import './index.css';
import App from './App';
import ReactDOMClient from 'react-dom/client';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import configureStore from './store';
import csrfFetch from './store/csrf';
import * as sessionActions from './store/session';
import { restoreSession } from './store/session';
import { ModalProvider } from './context/Modal';

const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
  window.sessionActions = sessionActions;
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

