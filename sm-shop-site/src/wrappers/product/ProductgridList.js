import PropTypes from "prop-types";
import React, { Fragment } from "react";
import { connect } from "react-redux";
import { addToCart } from "../../redux/actions/cartActions";
import ProductGridListSingle from "../../components/product/ProductGridListSingle";
import { isValidObject } from "../../util/helper";

import _ from 'lodash';

const ProductGrid = ({
  products,
  addToCart,
  cartItems,
  sliderClassName,
  spaceBottomClass,
  userData,
  strings
}) => {
  return (
    <Fragment>
      {products.map(product => {
        return (
          <ProductGridListSingle
            sliderClassName={sliderClassName}
            spaceBottomClass={spaceBottomClass}
            product={product}
            strings={strings}
            addToCart={addToCart}
            cartItem={cartItems}
            userData={userData}
            key={product.id}
          />
        );
      })}
    </Fragment>
  );
};

ProductGrid.propTypes = {
  addToCart: PropTypes.func,
  cartItems: PropTypes.object,
  products: PropTypes.array,
  sliderClassName: PropTypes.string,
  spaceBottomClass: PropTypes.string
};

const mapStateToProps = state => {
  return {
    cartItems: state.cartData.cartItems,
    userData: state.userData.userData
  };
};

const mapDispatchToProps = dispatch => {
  return {

    addToCart: (
      item,
      addToast,
      cartItem,
      quantityCount,
      defaultStore,
      userData,
      productOptions
    ) => {

      // check the quality cart
      let newQuantityCount = 0;
      if (!isValidObject(cartItem)) {
        // this case is empty cart
        newQuantityCount = quantityCount;
      } else {
        // this case: product has into cart
        cartItem.products = _.map(cartItem.products, p => {
          const subkey = _.map(p.cartItemattributes, option => {
            return option.productOptionValueId;
          }).toString();
          p.hash = p.id + subkey;
          return {...p};
        });

        const productOptionValueIdSelection = _.map(productOptions, option => {
          return option.id;
        }).toString();
        const productHashSelected = item.id + productOptionValueIdSelection;

        const checkProductExisting = _.filter(cartItem.products, p => {
          return p.hash === productHashSelected;
        });

        if (checkProductExisting && checkProductExisting.length > 0) {
          // has into cart
          newQuantityCount = checkProductExisting[0].quantity + quantityCount;
        } else {
          // not has into cart
          newQuantityCount = quantityCount;
        }
      }
      // end check

      dispatch(
        addToCart(
          item,
          addToast,
          cartItem.code,
          newQuantityCount,
          defaultStore,
          userData,
          productOptions
        )
      );
    },
    // addToWishlist: (item, addToast) => {
    //   dispatch(addToWishlist(item, addToast));
    // },
    // addToCompare: (item, addToast) => {
    //   dispatch(addToCompare(item, addToast));
    // }
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(ProductGrid);
