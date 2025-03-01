import PropTypes from "prop-types";
import React, { Fragment, useEffect, useState } from "react";
import MetaTags from "react-meta-tags";
import { BreadcrumbsItem } from "react-breadcrumbs-dynamic";
import { connect } from "react-redux";
import Layout from "../../layouts/Layout";
import Breadcrumb from "../../wrappers/breadcrumb/Breadcrumb";
// import RelatedProductSlider from "../../wrappers/product/RelatedProductSlider";
import ProductDescriptionTab from "../../wrappers/product/ProductDescriptionTab";
import ProductImageDescription from "../../wrappers/product/ProductImageDescription";
import WebService from '../../util/webService';
import constant from '../../util/constant';
import { setLoader } from "../../redux/actions/loaderActions";
import { multilanguage } from "redux-multilanguage";

import { fetchProducts } from "../../redux/actions/productActions";

const ProductDetails = ({ strings, location, productID, currentLanguageCode, setLoader, addProductDetails, defaultStore }) => {
  const { pathname } = location;
  
  const [friendlyUrl, setFriendlyUrl] = useState('');
  const [productIdData, setProductIdData] = useState();

  const [productDetails, setProductDetails] = useState();
  const [productReview, setProductReview] = useState([]);

  // load product id by product url
  const loadProductIdByUrl = async (productName) => {
    setLoader(true);
    let action = `${constant.ACTION.PRODUCTS}slug/${productName}?lang=${currentLanguageCode}`;
    try {
        let response = await WebService.get(action);
        setProductIdData(Number(response.id));
    } catch (error) {
        setLoader(false);
    }
  }

  useEffect(() => {
    if (pathname) {
        const _friendlyUrl = pathname.substr(pathname.lastIndexOf('/') + 1, pathname.length);
        setFriendlyUrl(_friendlyUrl);
    }
  }, [pathname]);

  useEffect(() => {
      if (friendlyUrl) {
        loadProductIdByUrl(friendlyUrl);
      }
  }, [friendlyUrl]);

  useEffect(() => {
    if (productIdData) {
      getProductDetails(defaultStore, productIdData);
      getReview(defaultStore, productIdData);
    }
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, [defaultStore, productIdData]);

  const getProductDetails = async (currentStore, id) => {
    setLoader(true);
    const baseUrl = `${constant.ACTION.PRODUCTS}${id}`;
    let action = baseUrl + '?lang=' + currentLanguageCode + '&store=' + currentStore;
    try {
      const response = await WebService.get(action);
      if (response) {
        // addProductDetails(response);
        console.log('response', response);

        setProductDetails(response);
        setLoader(false);
      }
    } catch (error) {
      setLoader(false);
    }
  }
  const getReview = async (currentStore, id) => {
    const baseUrl = `${constant.ACTION.PRODUCTS}${id}`;
    let action = baseUrl + '/reviews?store=' + currentStore;
    try {
      let response = await WebService.get(action);
      if (response) {
        setProductReview(response)
      }
    } catch (error) {
    }
  }
  return (
    <Fragment>
      <MetaTags>
        <title>{productDetails && productDetails.description.title}</title>
        <meta
          name="description"
          content={productDetails && productDetails.description.metaDescription}
        />
      </MetaTags>

      <BreadcrumbsItem to={process.env.PUBLIC_URL + "/"}>{strings["Home"]}</BreadcrumbsItem>
      <BreadcrumbsItem to={process.env.PUBLIC_URL + pathname}>
        {productDetails && productDetails.description.name}
      </BreadcrumbsItem>

      <Layout headerContainerClass="container-fluid"
        headerPaddingClass="header-padding-2"
        headerTop="visible">
        {/* breadcrumb */}
        <Breadcrumb />

        {/* product description with image */}
        {
          productDetails &&
          <ProductImageDescription
            spaceTopClass="pt-100"
            spaceBottomClass="pb-100"
            product={productDetails}
          />
        }

        {/* product description tab */}
        {
          productDetails &&
          <ProductDescriptionTab
            spaceBottomClass="pb-90"
            product={productDetails}
            review={productReview}
          />
        }

        {/* related product slider */}
        {/* <RelatedProductSlider
          spaceBottomClass="pb-95"
          category={product.category[0]}
        /> */}
      </Layout>
    </Fragment>
  );
};

ProductDetails.propTypes = {
  location: PropTypes.object,
  productID: PropTypes.number,
  currentLanguageCode: PropTypes.string,
};

const mapStateToProps = (state, ownProps) => {
  // const itemId = ownProps.match.params.id;
  return {
    productID: state.productData.productid,
    currentLanguageCode: state.multilanguage.currentLanguageCode,
    defaultStore: state.merchantData.defaultStore
  };
};
const mapDispatchToProps = dispatch => {
  return {
    setLoader: (value) => {
      dispatch(setLoader(value));
    },
    addProductDetails: (product) => {
      dispatch(fetchProducts(product));
    },
  };
};


export default connect(mapStateToProps, mapDispatchToProps)(multilanguage(ProductDetails));
