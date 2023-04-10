import { Switch, Route, Link } from "react-router-dom";
import { useSelector } from "react-redux";
import LoginFormPage from "./components/LoginFormPage";
import SignUpFormPage from "./components/SignUpFormPage";
import Navigation from "./components/Navigation";
import ItemIndex from "./components/ItemIndex"
import ItemShow from "./components/ItemShow";
import CheckoutList from "./components/CheckoutList";





function App() {
  const currentUser = useSelector(state => state.session.user);

  return (
    <>

      <Switch>

        <Route path="/login">
          <LoginFormPage />
        </Route>

        <Route path="/signup">
          <SignUpFormPage />
        </Route>

        <Route path="/">
          <Navigation />

          <Route exact path="/">
            <ItemIndex />
          </Route>

          <Route path="/all">
            <ItemIndex />
          </Route>

          <Route path="/category/:categoryName">
            <ItemIndex />
          </Route>

          <Route path="/items/:itemId">
            <ItemShow />
          </Route>

          <Route path="/checkout">
            <CheckoutList />
          </Route>

        </Route>
      
      </Switch>

    </>
  );
}

export default App;
