# AMAZOO

Check out the [Live Site](https://amazoo.onrender.com)!

#### Introduction

Amazoo is a clone of the Amazon.com where users can purchase exotic animals. An Amazoo user can add multiple animals to their cart, search animals by category or search, and make 'purchases'. As a frequent user of Amazon, I was interested in building out a fun platform where users can interact with their favorite animals in a novel way. The technologies implemented in this project include:
* Languages: JavaScript, Ruby, HTML, CSS
* Frontend: React-Redux
* Backend: Ruby on Rails
* Database: PostgreSQL
* Hosting: Render
* Asset Storage: AWS S3

## Features

### Animal Listings

Users can view their favorite animals in the style of Amazon.com's product listings. On this page, they will see a photo from the animal, several bullet points about the featured animal, and an option to add the animal to their cart (with a selected quantity).

![animal_listings](https://user-images.githubusercontent.com/111205278/232151694-4ce2e66b-9ace-4f0d-aa6c-a5073a06fd47.gif)

```js
<div id="showMaster">
    <div id="showImageBox" className="cardItemImageBox">
        <img id="showPageImage" src={item?.photoUrl} alt="" />
    </div>
    <div id="showContent">
        <div id="showName">{item?.name}</div>
        <Link to={`/category/${item?.animalType}`}>
            <div id="showType" className="showLink">{item?.animalType}</div>
        </Link>

        <img src={myRating} id="showRating" className="ratingsPic" />
        <span id="showNumReviews" class="numReviews">{Math.floor(Math.random() * 250)}</span>


        <div id="showDivider"></div>

        <Price price={item?.price}/>
        <div id="freeReturns">FREE Returns</div>

        <div id="showDivider"></div>

        <div id="showDescBox">
            <h3>About this animal</h3>
            <ul id="descList">
                {descArr.map(fact => {
                    return <li key={fact} className="bullet">{fact}</li>
                })}
            </ul>
        </div>

    </div>

    <AddItemForm price={item?.price}/>
</div>
```

### Shopping Cart

Upon adding animals to their cart from the Animal Listing pages, users can view every animal that they added in their cart. On the 'checkout' page, users can update the quantities of animals they would like to purchase and remove animals from their cart. Pressing a purchase button will provide users a summary of their purchase.

![cart_1](https://user-images.githubusercontent.com/111205278/232152645-801c1a90-8282-4095-99f9-c277f8ad7a93.gif)

```js
<div id="checkoutListItems">
  <div className="checkoutListItemsHeader">
      <div id="shoppingCartText">Shopping Cart</div>
      <div id="shoppingCartPrice">Price</div>
  </div>
  {cartItems.map((cartItem) => {
      return (
          <React.Fragment key={cartItem.id}>
              <div className="checkoutListDivider" />
              <CheckoutCard cartItem={cartItem}/>
          </React.Fragment>
      )
  })}
  <div className="checkoutListDivider" />

  <div id="subtotalContainer">
      Subtotal: 
      ({calcTotalItems(cartItems)} items): &nbsp;

      <span className="bold">
          ${formatPrice(calcSubtotal(cartItems, items))}.00
      </span>
  </div>
</div>
```

If there is no user currently signed in, items are still able to be added to the cart and will be transferred to the logged in user upon signing in.

![cart_2](https://user-images.githubusercontent.com/111205278/232152939-ce150ea4-f11b-44a2-8a47-bcf739dfbcfa.gif)

```js
export const addCartItemToLS = (cartItem) => (dispatch, getState) => {
    const prevState = getState();
    const currentItem = prevState.cartItems[cartItem.id];
    if (currentItem) {
        cartItem.quantity += currentItem.quantity;
    }
    dispatch(receiveCartItem(cartItem));
    storeCartItems(getState().cartItems);
}
```
```rb
def transfer
    params[:cart_items].each do |cart_item_param|
        cart_item = CartItem.find_by(user_id: current_user.id, item_id: cart_item_param[:item_id])
        if cart_item
            cart_item.quantity += cart_item_param[:quantity]
        else
            cart_item = CartItem.new(cart_item_param.permit(:item_id, :quantity))
            cart_item.user_id = current_user.id
        end
        cart_item.save
    end
end
```

### Search/Categories

Users have the option to filter animals by type in the Navigation Bar. A search bar is also present if a user has a specific animal they want to view.

![categories](https://user-images.githubusercontent.com/111205278/232153443-9d506fc8-eea7-46ac-afb4-8c9ec4b101ec.gif)

![search](https://user-images.githubusercontent.com/111205278/232153962-80f8c9eb-6237-4192-bcbc-7503fc9e6bd8.gif)

```js
export const fetchSelectItems = (query) => async dispatch => {
    const res = await csrfFetch(`/api/items/search/${query}`);
    const data = await res.json();
    dispatch(removeAllItems())
    dispatch(receiveItems(data));
}
```
```rb
def search
    @items  = Item.where("name iLIKE '%#{params[:query]}%' OR animal_type iLIKE '%#{params[:query]}%'")
    render :index
end
```

### User Authentication

Users can save their credentials in Amazoo's server by entering their information in a sign-up form. Access to their profile will be blocked unless the correct credentials are provided. Error messaging for invalid inputs are styled like Amazon.com

![auth](https://user-images.githubusercontent.com/111205278/232154575-c750f15e-8941-4ae3-bb3a-b7fe2a3d10c5.gif)

```js
export const signUp = (user) => async dispatch => {
    const { name, email, password } = user
    const res = await csrfFetch('/api/users', {
        method: 'POST',
        body: JSON.stringify({ name, email, password })
    });
    const data = await res.json();
    storeCurrentUser(data.user);
    dispatch(setSessionUser(data.user));

    dispatch(transferCartItems)
    return res;
}

export const restoreSession = () => async dispatch => {
    const res = await csrfFetch('/api/session')
    storeCSRF(res);
    const data = await res.json();
    storeCurrentUser(data.user);
    dispatch(setSessionUser(data.user))
}

const storeCurrentUser = user => {
    if (user) sessionStorage.setItem('currentUser', JSON.stringify(user));
    else sessionStorage.removeItem('currentUser');
}
```

