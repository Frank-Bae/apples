import React from 'react';

export default class CheckoutForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      name: '',
      creditCard: '',
      shippingAddress: ''
    };
    this.handleChangeName = this.handleChangeName.bind(this);
    this.handleChangeCreditCard = this.handleChangeCreditCard.bind(this);
    this.handleChangeShippingAddress = this.handleChangeShippingAddress.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChangeName(event) {
    this.setState({
      name: event.target.value
    });
  }

  handleChangeCreditCard(event) {
    this.setState({
      creditCard: event.target.value
    });
  }

  handleChangeShippingAddress(event) {
    this.setState({
      shippingAddress: event.target.value
    });
  }

  handleSubmit(event) {
    event.preventDefault();
    const { name, creditCard, shippingAddress } = this.state;
    if (name !== '' && creditCard !== '' && shippingAddress !== '') {
      const information = { ...this.state };
      this.props.placeOrder(information);
    }
  }

  render() {
    const itemTotals = this.props.cart.length;
    let result = 0;
    for (let i = 0; i < itemTotals; i++) {
      const price = this.props.cart[i].price;
      result += price;
    }

    return (
      <div className="container mb-5">
        <div className="alert alert-warning" role="alert">
          <h2>Do not input your personal information</h2>
        </div>
        <h1 className="mt-5">My Cart</h1>
        <p>Order Total: ${(result / 100).toFixed(2)}</p>
        <form onSubmit={this.handleSubmit}>
          <div className="form-group">
            <label htmlFor="name">Name</label>
            <input required onChange={this.handleChangeName} type="text" className="form-control" id="name" placeholder="John Doe"/>
          </div>
          <div className="form-group">
            <label htmlFor="exampleInputEmail1">Email address</label>
            <input type="email" className="form-control" id="exampleInputEmail1" placeholder="Enter email"/>
          </div>
          <div className="form-group">
            <label htmlFor="creditCard">Credit Card</label>
            <input required onChange={this.handleChangeCreditCard} type="number" className="form-control" id="creditcard" placeholder="0000-0000-0000-0000"/>
          </div>
          <div className="form-group">
            <label htmlFor="shippingAddress">Shipping Address</label>
            <textarea required onChange={this.handleChangeShippingAddress} className="form-control" id="shippingAddress" rows="2" placeholder="9382 Brooklyn Blvd, New York, NY, 01923"></textarea>
          </div>
          <div className="d-flex justify-content-between row mt-5">
            <p className="ml-3 hover" onClick={() => this.props.setView('catalog', {})}>Continue Shopping</p>
            <button type="submit" className="mr-3 btn btn-primary">Checkout</button>
          </div>
        </form>
      </div>
    );
  }
}
