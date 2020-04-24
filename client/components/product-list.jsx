import React from 'react';
import ProductListItems from './product-list-items';

export default class ProductList extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      products: []
    };
  }

  componentDidMount() {
    this.getProducts();
  }

  getProducts() {
    fetch('/api/products')
      .then(response => {
        return response.json();
      })
      .then(data => {
        this.setState({
          products: data
        });
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }

  render() {
    return (
      <div className="row">
        <div className="col"><ProductListItems /></div>
        <div className="col"><ProductListItems /></div>
        <div className="col"><ProductListItems /></div>
      </div>
    );
  }
}
