import { SET_MERCHANT } from "../actions/storeAction";
import { SET_STORE } from "../actions/storeAction";

import { LOAD_BUSINESS_HOURS, CHECK_SHOP_OPEN_NOW, TIME_SHOP_WORKING } from "../actions/storeAction";

const initState = {
    merchant: '',
    defaultStore: '',
    businessHours: {},
    shopOpenNow: true,
    timeShopWorking: {
        startTime: '',
        endTime: ''
    }
};

const storeReducer = (state = initState, action) => {
    if (action.type === SET_MERCHANT) {
        return {
            ...state,
            merchant: action.payload
        };
    }
    if (action.type === SET_STORE) {
        return {
            ...state,
            defaultStore: action.payload
        };
    }
    if (action.type === LOAD_BUSINESS_HOURS) {
        return {
            ...state,
            businessHours: action.payload
        };
    }
    if (action.type === CHECK_SHOP_OPEN_NOW) {
        return {
            ...state,
            shopOpenNow: action.payload
        };
    }
    if (action.type === TIME_SHOP_WORKING) {
        return {
            ...state,
            timeShopWorking: {startTime: action.payload.startTime, endTime: action.payload.endTime}
        };
    }

    return state;
};

export default storeReducer;
