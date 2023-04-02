import React from 'react';
import './index.css';
import App from './App';
import ReactDOMClient from 'react-dom/client';
import { Provider } from 'react-redux';
import { BrowserRouter } from 'react-router-dom';
import configureStore from './store';
import csrfFetch, { restoreCSRF } from './store/csrf';

const store = configureStore();

if (process.env.NODE_ENV !== 'production') {
  window.store = store;
  window.csrfFetch = csrfFetch;
}

const root = ReactDOMClient.createRoot(document.getElementById('root'));


const renderApp = () => {
  root.render(
      <React.StrictMode>
        <Provider store={store}>
          <BrowserRouter>
            <App />
          </BrowserRouter>
        </Provider>
      </React.StrictMode>
  )
}

if (sessionStorage.getItem('X-CSRF-Token') === null) {
  restoreCSRF().then(renderApp);
} else {
  renderApp();
}