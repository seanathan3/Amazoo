import { Switch, Route, Link } from "react-router-dom";
import { useSelector, useDispatch } from "react-redux";
import LoginFormPage from "./components/LoginFormPage";
import SignUpFormPage from "./components/SignUpFormPage";
import Navigation from "./components/Navigation";
import { logout } from "./store/session";

function App() {
  const currentUser = useSelector(state => state.session.user);
  const dispatch = useDispatch();

  return (
    <>
      <h1>Amazoo</h1>
      <p>**In development**</p>


      <Navigation />

      <Switch>
        <Route path="/login">
          <LoginFormPage />
          <Link to="/">Home</Link>
        </Route>
        <Route path="/signup">
          <SignUpFormPage />
          <Link to="/">Home</Link>
        </Route>
        <Route path="/">
        </Route>
      </Switch>
      <h4>Current User: {currentUser?.name ? currentUser.name : 'nobody'}</h4>


    </>
  );
}

export default App;
