import PropTypes from "prop-types";
import React, { Fragment } from "react";
import { connect } from "react-redux";
// import { getProducts } from "../../helpers/product";
import ProductGridSingle from "../../components/product/ProductGridSingle";
import { addToCart } from "../../redux/actions/cartActions";
// import { addToWishlist } from "../../redux/actions/wishlistActions";
// import { addToCompare } from "../../redux/actions/compareActions";
import { isValidObject } from "../../util/helper";

import _ from 'lodash';

const ProductGrid = ({
  products,
  currency,
  addToCart,
  // addToWishlist,
  // addToCompare,
  cartData,
  // wishlistItems,
  // compareItems,
  sliderClassName,
  spaceBottomClass,
  colorClass,
  titlePriceClass,
  userData
}) => {
  return (
    <Fragment>
      {products.map((product) => {
        return (
          <ProductGridSingle
            sliderClassName={sliderClassName}
            spaceBottomClass={spaceBottomClass}
            colorClass={colorClass}
            product={product}
            // currency={currency}
            addToCart={addToCart}
            cartData={cartData}
            userData={userData}
            // addToWishlist={addToWishlist}
            // addToCompare={addToCompare}
            // cartItem={cartItems}
            // cartItems.filter((cartItem) => cartItem.id === product.id)[0]
            // }
            // wishlistItem={
            //   wishlistItems.filter(
            //     (wishlistItem) => wishlistItem.id === product.id
            //   )[0]
            // }
            // compareItem={
            //   compareItems.filter(
            //     (compareItem) => compareItem.id === product.id
            //   )[0]
            // }
            key={product.id}
            titlePriceClass={titlePriceClass}
          />
        );
      })}
    </Fragment>
  );
};

ProductGrid.propTypes = {
  addToCart: PropTypes.func,
  // addToCompare: PropTypes.func,
  // addToWishlist: PropTypes.func,
  compareItems: PropTypes.array,
  currency: PropTypes.object,
  products: PropTypes.array,
  sliderClassName: PropTypes.string,
  spaceBottomClass: PropTypes.string,
  colorClass: PropTypes.string,
  titlePriceClass: PropTypes.string,
  wishlistItems: PropTypes.array
};

const mapStateToProps = (state, ownProps) => {
  return {
    // products: getProducts(
    //   state.productData.products,
    //   ownProps.category,
    //   ownProps.type,
    //   ownProps.limit
    // ),
    // currency: state.currencyData,
    cartData: state.cartData.cartItems,
    userData: state.userData.userData
    // wishlistItems: state.wishlistData,
    // compareItems: state.compareData
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    addToCart: (
      item,
      addToast,
      cartItem,
      quantityCount,
      defaultStore,
      userData,
      productOptions,
      // selectedProductColor,
      // selectedProductSize
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
