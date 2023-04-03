import { Switch, Route, Link } from "react-router-dom";
import LoginFormPage from "./components/LoginFormPage";
import SignUpFormPage from "./components/SignUpFormPage";
import { useSelector } from "react-redux";

function App() {
  const currentUser = useSelector(state => state.session.user)

  return (
    <>
      <h1>Amazoo</h1>
      <p>**In development**</p>

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
          <Link to="/login">Sign In</Link>
          <br />
          <Link to="/signup">Sign Up</Link>
        </Route>
      </Switch>
      <h4>Current User: {currentUser?.name ? currentUser.name : 'nobody'}</h4>
    </>
  );
}

export default App;
