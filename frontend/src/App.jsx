import { Switch, Route, Link } from "react-router-dom";
import LoginFormPage from "./components/LoginFormPage";

function App() {
  return (
    <>
      <h1>Amazoo</h1>
      <p>**In development**</p>

      <Switch>
        <Route path="/login">
          <LoginFormPage />
          <Link to="/">Home</Link>
        </Route>
        <Route path="/">
          <Link to="/login">Sign In</Link>
        </Route>
      </Switch>
    </>
  );
}

export default App;
