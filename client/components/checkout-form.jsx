import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: null,
      creditCard: null
    };
  }

  render() {
    return (
      <div className="container">
        <h1 className="mt-5">My Cart</h1>
        <p>Order Total: null</p>
        <form action="">
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input type="text" className="form-control" id="name" placeholder="John Doe"/>
          </div>
          <div className="form-group">
            <label htmlFor="creditCard">Credit Card</label>
            <input type="number" className="form-control" id="creditcard" placeholder="0000-0000-0000-0000"/>
          </div>
          <div className="form-group">
            <label htmlFor="shippingAddress">Shipping Address</label>
            <textarea className="form-control" id="shippingAddress" rows="2" placeholder="9382 Brooklyn Blvd, New York, NY, 01923"></textarea>
          </div>
        </form>
      </div>
    );
  }
}
