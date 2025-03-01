import PropTypes from "prop-types";
import React, { useState, useEffect } from "react";
import { Link } from "react-router-dom";
import { animateScroll } from "react-scroll";
import FooterCopyright from "../../components/footer/FooterCopyright";
import FooterNewsletter from "../../components/footer/FooterNewsletter";
import { multilanguage } from "redux-multilanguage";
import { connect } from "react-redux";

import _ from 'lodash';
import * as moment from 'moment';
import { setShopOpenNow, setTimeShopWorking } from "../../redux/actions/storeAction";

const Footer = ({
  backgroundColorClass,
  spaceTopClass,
  spaceBottomClass,
  spaceLeftClass,
  spaceRightClass,
  containerClass,
  extraFooterClass,
  sideMenu,
  merchant,
  strings,
  businessHours,
  setShopOpenNow,
  setTimeShopWorking
}) => {
  const [scroll, setScroll] = useState(0);
  const [top, setTop] = useState(0);
  const [timeOpenNow, setTimeOpenNow] = useState('');

  useEffect(() => {
    setTop(100);
    window.addEventListener("scroll", handleScroll);
    return () => {
      window.removeEventListener("scroll", handleScroll);
    };
  }, []);

  const scrollToTop = () => {
    animateScroll.scrollToTop();
  };

  const handleScroll = () => {
    setScroll(window.scrollY);
  };

  const isTimeBetween = (startTime, endTime, serverTime) => {
    const nowDate = moment().format('yyyy-MM-DD');
    const formatDate = 'yyyy-MM-DD HH:mm';
    const _startDateTime = `${nowDate} ${startTime}`;
    const _endDateTime = `${nowDate} ${endTime}`;
    const serverDateTime = `${nowDate} ${serverTime}`;
    
    const startDateTime = moment(_startDateTime).format(formatDate);
    const endDateTime = moment(_endDateTime).format(formatDate);
    const currentDateTime = moment(serverDateTime).format(formatDate);

    const readyOpen = moment(currentDateTime).isBetween(startDateTime, endDateTime);
    return readyOpen;

  };

  useEffect(() => {
    const checkOpenNow = () => {
      if (businessHours && businessHours.businessSchedules && businessHours.businessSchedules.length > 0) {
        const options = {
          timeZone: businessHours.timeZone,
          weekday: 'long',
          year: 'numeric',
          month: 'numeric',
          day: 'numeric',
          hour: 'numeric',
          minute: 'numeric',
          second: 'numeric',
        };
        const currentTimeFormatter = new Intl.DateTimeFormat([], options);
        const nowDate = currentTimeFormatter.format(new Date());
        const currentTimeOnStore = moment(nowDate).format('hh:mm A');
        const currentDay = nowDate.substr(0, nowDate.indexOf(','));
        const businessSchedules = businessHours.businessSchedules;
        const daySelected = _.filter(businessSchedules, d => _.upperCase(d.day) === _.upperCase(currentDay) && d.enabled === true);
        if (daySelected && daySelected.length > 0) {
          const isOpenNow = isTimeBetween(daySelected[0].openingHour, daySelected[0].closingHour, currentTimeOnStore);
          setShopOpenNow(isOpenNow);
          setTimeShopWorking({startTime: daySelected[0].openingHour, endTime: daySelected[0].closingHour});
        }
      }
    };
    checkOpenNow();
    const interval = setInterval(() => {
      checkOpenNow();
    }, 60000); 
    // 2 mins = 60000
    // 5 mins = 300000
    return () => clearInterval(interval);
  }, [businessHours]);

  useEffect(() => {
    if (businessHours && businessHours.businessSchedules 
      && businessHours.businessSchedules.length > 0 && businessHours.timeZone) {
      const options = {
        timeZone: businessHours.timeZone,
        weekday: 'long',
        year: 'numeric',
        month: 'numeric',
        day: 'numeric',
        hour: 'numeric',
        minute: 'numeric',
        second: 'numeric',
      };
      const currentTimeFormatter = new Intl.DateTimeFormat([], options);
      const nowDate = currentTimeFormatter.format(new Date());
      const currentTimeOnStore = moment(nowDate).format('hh:mm A');
      const currentDay = nowDate.substr(0, nowDate.indexOf(','));
      const businessSchedules = businessHours.businessSchedules;
      const daySelected = _.filter(businessSchedules, d => _.upperCase(d.day) === _.upperCase(currentDay) && d.enabled === true);
      if (daySelected && daySelected.length > 0) {
        const isOpenNow = isTimeBetween(daySelected[0].openingHour, daySelected[0].closingHour, currentTimeOnStore);
        setTimeOpenNow(`${daySelected[0].openingHour} - ${daySelected[0].closingHour} ${isOpenNow ? 'Open now' : 'Closed'}`);
      }
    }
  }, [businessHours]);

  return (
    <footer
      className={`footer-area ${
        backgroundColorClass ? backgroundColorClass : ""
        } ${spaceTopClass ? spaceTopClass : ""} ${
        spaceBottomClass ? spaceBottomClass : ""
        } ${extraFooterClass ? extraFooterClass : ""} ${
        spaceLeftClass ? spaceLeftClass : ""
        } ${spaceRightClass ? spaceRightClass : ""}`}
    >
      <div className={`${containerClass ? containerClass : "container"}`}>
        <div className="row">
          <div className={sideMenu ? "col-xl-3 col-sm-3" : "col-lg-2 col-sm-3"}>
            {/* footer copyright */}
            <FooterCopyright
              footerLogo="/assets/img/logo/logo.png"
              spaceBottomClass="mb-30"
            />
          </div>
          <div className={sideMenu ? "col-xl-3 col-sm-3" : "col-lg-3 col-sm-3"}>
            <div className="footer-widget mb-30">
              <div className="footer-title">
                <h3>{strings["Address"]}</h3>
              </div>
              <div className="footer-list">
                {

                  merchant &&
                  <ul>
                    <li>
                      <Link to="">
                        {merchant.address.address}  {merchant.address.city}, {merchant.address.stateProvince},
                       {merchant.address.country} <br /> {merchant.address.postalCode}
                      </Link>
                    </li>
                    <li>
                      <Link to="">
                        {strings["Tel"]}: {merchant.phone}
                      </Link>
                    </li>
                    <li>
                      <Link to="">
                        {strings["E-mail"]} : {merchant.contactEmail}
                      </Link>
                    </li>
                    {timeOpenNow && <li>
                      {timeOpenNow}
                    </li>}
                  </ul>
                }
              </div>
            </div>
          </div>
          <div className={sideMenu ? "col-xl-3 col-sm-3" : "col-lg-3 col-sm-3"}>
            <div className={sideMenu ? "footer-widget mb-30" : "footer-widget mb-30"} >
              <div className="footer-title">
                <h3>{strings["USEFUL LINKS"]}</h3>
              </div>
              <div className="footer-list">
                <ul>
                  <li>
                    <Link to={"/contact"}>{strings["Contact"]}</Link>
                  </li>
                  <li>
                    <Link to={"/login"}>{strings["Login"]}</Link>
                  </li>
                  <li>
                    <Link to={"/register"}>{strings["Register"]}</Link>
                  </li>
                  {/* <li>
                    <Link to={process.env.PUBLIC_URL + "#/"}>Returns</Link>
                  </li>
                  <li>
                    <Link to={process.env.PUBLIC_URL + "#/"}>
                      Support Policy
                    </Link>
                  </li>
                  <li>
                    <Link to={process.env.PUBLIC_URL + "#/"}>Size guide</Link>
                  </li>
                  <li>
                    <Link to={process.env.PUBLIC_URL + "#/"}>FAQs</Link>
                  </li> */}
                </ul>
              </div>
            </div>
          </div>
          {/* <div
            className={`${
              sideMenu ? "col-xl-3 col-sm-4" : "col-lg-2 col-sm-6"
              }`}
          >
            <div
              className={`${
                sideMenu
                  ? "footer-widget mb-30 ml-145"
                  : "footer-widget mb-30 ml-75"
                }`}
            >
              <div className="footer-title">
                <h3>FOLLOW US</h3>
              </div>
              <div className="footer-list">
                <ul>
                  <li>
                    <a
                      href="//www.facebook.com"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Facebook
                    </a>
                  </li>
                  <li>
                    <a
                      href="//www.twitter.com"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Twitter
                    </a>
                  </li>
                  <li>
                    <a
                      href="//www.instagram.com"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Instagram
                    </a>
                  </li>
                  <li>
                    <a
                      href="//www.youtube.com"
                      target="_blank"
                      rel="noopener noreferrer"
                    >
                      Youtube
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div> */}
          <div className={sideMenu ? "col-xl-3 col-sm-8" : "col-lg-4 col-sm-3"}>
            {/* footer newsletter */}
            <FooterNewsletter
              strings={strings}
              spaceBottomClass="mb-30"
              // spaceLeftClass="ml-70"
              sideMenu={sideMenu}
            />
          </div>
        </div>
      </div>
      <button
        className={`scroll-top ${scroll > top ? "show" : ""}`}
        onClick={() => scrollToTop()}
      >
        <i className="fa fa-angle-double-up"></i>
      </button>
    </footer>
  );
};

Footer.propTypes = {
  backgroundColorClass: PropTypes.string,
  containerClass: PropTypes.string,
  extraFooterClass: PropTypes.string,
  sideMenu: PropTypes.bool,
  spaceBottomClass: PropTypes.string,
  spaceTopClass: PropTypes.string,
  spaceLeftClass: PropTypes.string,
  spaceRightClass: PropTypes.string
};


const mapStateToProps = state => {
  return {
    merchant: state.merchantData.merchant,
    businessHours: state.merchantData.businessHours,
  };
};

const mapDispatchToProps = dispatch => {
  return {
    setShopOpenNow: (value) => {
      dispatch(setShopOpenNow(value));
    },
    setTimeShopWorking: (value) => {
      dispatch(setTimeShopWorking(value));
    }
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(multilanguage(Footer));
// export default FooterOne;
