import PropTypes from "prop-types";
import React, { useEffect, useState } from "react";
import { multilanguage } from "redux-multilanguage";
import { connect } from "react-redux";
import WebService from '../../util/webService';
import constant from '../../util/constant';
// import { setCurrency } from "../../redux/actions/currencyActions";
import LanguageCurrencyChanger from "./sub-components/LanguageCurrencyChanger";

import _ from 'lodash';

const HeaderTop = ({
  strings,
  currentLanguageCode,
  dispatch,
  borderStyle
}) => {
  
  const [headerMessage, setHeaderMessage] = useState('');
  const [testMode, setTestMode] = useState('');

  useEffect(() => {
    getContentMessage();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);
  /**Home page hero content */
  const getContentMessage = async () => {
    // let action = constant.ACTION.CONTENT + constant.ACTION.BOXES + constant.ACTION.HEADER_MESSAGE + '?lang=' + currentLanguageCode;
    let action = constant.ACTION.CONTENT + constant.ACTION.BOXES + '?count=10&page=0&';
    try {
      let response = await WebService.get(action);      
      if (response && response.items && response.items.length > 0) {
        
        // header message
        const _headerMessage = _.filter(response.items, d => d.code === 'headerMessage' && d.visible === true);
        if (_headerMessage && _headerMessage.length > 0) {
          setHeaderMessage(_headerMessage[0].description.description);
        }

        // test mode
        const _testMode = _.filter(response.items, d => d.code === 'testMode' && d.visible === true);
        if (_testMode && _testMode.length > 0) {
          setTestMode(_testMode[0].description.description);
        }

      }
    } catch (error) {
    }
  }
  return (
    <div
      className={`header-top-wap ${
        borderStyle === "fluid-border" ? "border-bottom" : ""
        }`}
    >
      <LanguageCurrencyChanger
        currentLanguageCode={currentLanguageCode}
        dispatch={dispatch}
      />
      {testMode && <div className="noted-web">
        <p dangerouslySetInnerHTML={{ __html: testMode.replace("]]>", "") }}>
        </p>
      </div>}
      {headerMessage && <div className="header-offer">
        <p dangerouslySetInnerHTML={{ __html: headerMessage.replace("]]>", "") }}>
        </p>
      </div>}
    </div>
  );
};

HeaderTop.propTypes = {
  borderStyle: PropTypes.string,
  currentLanguageCode: PropTypes.string,
  dispatch: PropTypes.func,
  strings: PropTypes.object
};

const mapStateToProps = state => {
  return {
    // currency: state.currencyData
  };
};

const mapDispatchToProps = dispatch => {
  return {
    // setCurrency: currencyName => {
    //   dispatch(setCurrency(currencyName));
    // }
  };
};

export default connect()(multilanguage(HeaderTop));
