import { Switch, Route, Link } from "react-router-dom";
import { useSelector } from "react-redux";
import LoginFormPage from "./components/LoginFormPage";
import SignUpFormPage from "./components/SignUpFormPage";
import Navigation from "./components/Navigation";
import ItemIndex from "./components/ItemIndex"





function App() {
  const currentUser = useSelector(state => state.session.user);

  return (
    <>

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
          <Navigation />
          <ItemIndex />
        </Route>

      </Switch>
      <h4>Current User: {currentUser?.name ? currentUser.name : 'nobody'}</h4>


    </>
  );
}

export default App;
