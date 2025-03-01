/**
 * @license
 */
export const environment = {
    production: false,
    //GOOGLE MAP
    googleApiKey: window["env"]["APP_MAP_API_KEY"] || '',
    //MARKETPLACE | BTB | STANDARD
    mode: 'STANDARD',
    captchaKey: '6Lc-PxAcAAAAALch9vL__EJMRuPDoWtaTsO-E-Yb',
    //API URL
    apiUrl: 'https://dev-api.uniteaannarbor.com/api',
    merchantStore: 'UNITEAANNARBOR',
    shippingApi: 'http://localhost:9090/api',
    shopSite: 'https://dev.uniteaannarbor.com/',
    client: {
        language: {
            default: 'en',
            array: [
                'en',
                'es',
                'fr',
                'ru',
                'ar'
            ],
        },
    }
};
