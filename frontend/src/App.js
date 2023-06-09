import { Switch, Route, Link } from "react-router-dom";
import { useSelector } from "react-redux";
import LoginFormPage from "./components/LoginFormPage";
import SignUpFormPage from "./components/SignUpFormPage";
import Navigation from "./components/Navigation";
import ItemIndex from "./components/ItemIndex"
import ItemShow from "./components/ItemShow";
import CheckoutList from "./components/CheckoutList";
import OrderMessage from "./components/OrderMessage";
import ItemAddedMessage from "./components/ItemAddedMessage";
import ReviewForm from "./components/ReviewForm";

function App() {
  const currentUser = useSelector(state => state.session.user);

  return (
    <>

      <Switch>

        <Route path="/login">
          <LoginFormPage />
        </Route>

        <Route path="/login/checkout">
          <LoginFormPage redirecting={true} />
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

          <Route path="/search/:query">
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

          <Route path="/orderMessage/:count">
            <OrderMessage />
          </Route>

          <Route path="/itemAddedMessage/:itemId">
            <ItemAddedMessage />
          </Route>

          <Route exact path="/reviews/:itemId/:reviewId/edit">
            <ReviewForm />
          </Route>

          <Route exact path="/reviews/:itemId">
            <ReviewForm />
          </Route>

        </Route>
      
      </Switch>

    </>
  );
}

export default App;
