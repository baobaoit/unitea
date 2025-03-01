import WebService from '../../util/webService';
import constant from '../../util/constant';
export const SET_MERCHANT = "SET_MERCHANT";
export const SET_STORE = "SET_STORE";

export const LOAD_BUSINESS_HOURS = "LOAD_BUSINESS_HOURS";
export const CHECK_SHOP_OPEN_NOW = "CHECK_SHOP_OPEN_NOW";
export const TIME_SHOP_WORKING = "TIME_SHOP_WORKING";

export const setMerchant = () => {
    return async dispatch => {
        let action = constant.ACTION.STORE + window._env_.APP_MERCHANT;
        try {
            let response = await WebService.get(action);
            // console.log(response);
            // if (response) {
            dispatch({
                type: SET_MERCHANT,
                payload: response
            });
            dispatch(setStore(response.code));
            // load business hours
            dispatch(loadBusinessHours(response.code));
        } catch (error) {
        }

    };
};

export const setStore = (storeCode) => {
    return async dispatch => {
        dispatch({
            type: SET_STORE,
            payload: storeCode
        });
    }
}

export const loadBusinessHours = (storeCode) => {
    return async dispatch => {
        let action = `${constant.ACTION.BUSINESS_TIME}?store=${storeCode}`;
        try {
            let response = await WebService.get(action);
            // console.log(response);
            dispatch({
                type: LOAD_BUSINESS_HOURS,
                payload: response
            });
        } catch (error) {
        }

    };
};

export const setShopOpenNow = (isOpenHour) => {
    return async dispatch => {
        dispatch({
            type: CHECK_SHOP_OPEN_NOW,
            payload: isOpenHour
        });
    }
}

export const setTimeShopWorking = (payload) => {
    return async dispatch => {
        dispatch({
            type: TIME_SHOP_WORKING,
            payload: payload
        });
    }
}