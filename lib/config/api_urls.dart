String contactUsNumber = "96891707438";
String contactUsEmail = "info@tamween.om";

int androidLocalVersion = 1;
int iosLocalVersion = 1;
String contactUsInstagram =
    "https://instagram.com/tamween_om?igshid=YmMyMTA2M2Y=";
String contactUsTwitter = "https://twitter.com/tamween_om?s=11";
String contactUsFaceBook = "";
String domain = "http://3.110.85.196";

String middle = "";
String baseUrl = "$domain$middle/public/api";
String imageBaseUrl = "$domain/";
String versionCheckUrl = "$baseUrl/common/tamween-version";
String loginUrl = "$baseUrl/auth/login";
String sendOtpUrl = "$baseUrl/auth/send-otp";
String updatePasswordUrl = "$baseUrl/auth/update-password";

String signUpUrl = "$baseUrl/auth/signup";

String updateProfileUrl = "$baseUrl/buyer/profile/update";

String customerDashboardDataUrl = "$baseUrl/common/dashboard";
String fetchProductsUrl = "$baseUrl/common/products";
String fetchOffersProductsUrl = "$baseUrl/common/offer-products";

// /////Favorites
String fetchFavoriteProductsUrl = "$baseUrl/buyer/favorites/list";
String markFavoriteUrl = "$baseUrl/buyer/favorites/add";
String removeFavoriteUrl = "$baseUrl/buyer/favorites/remove";

String constantsUrl = "$baseUrl/common/constants";

// ///buyer requests
// cart
String updateCartUrl = "$baseUrl/buyer/cart/update";
String listCartUrl = "$baseUrl/buyer/cart/list";

String fetchBuyersRequestUrl = "$baseUrl/buyer/requests/list";
String fetchBuyersInvoicesUrl = "$baseUrl/buyer/invoices/list";
String fetchLocationsUrl = "$baseUrl/buyer/profile/my-locations";
String addOrderUrl = "$baseUrl/buyer/requests/add";
String downloadCartUrl = "$baseUrl/buyer/requests/cart-download";

String addLocationUrl = "$baseUrl/buyer/profile/add-location";
// ///info
String termsConditionsUrl = "$domain$middle/info/terms-and-condtions/";
String contactUsUrl = "$domain$middle/info/contact-us/";
String aboutUsUrl = "$domain$middle/info/about-us/";
String privacyPolicyUrl = "$domain$middle/info/privacy-policy/";
String supplierCommitmentUrl = "$domain$middle/info/supplier-commitment/";
String exchangeReturnUrl = "$domain$middle/info/exchange-return/";

// ////payment

String payNowUrl = "$baseUrl/payment/pay-invoice-money?request_id=";
String updateRequestPaymentStatusUrl = "$baseUrl/payment/request-action";

// ///////supplier

String fetchSupplierDashboardUrl = "$baseUrl/provider/dashboard";
String fetchSupplierProductsUrl = "$baseUrl/provider/products/list";
String addSupplierProductUrl = "$baseUrl/provider/products/add";
String updateSupplierProductUrl = "$baseUrl/provider/products/update";
String addProductStockSupplierUrl = "$baseUrl/provider/products/add-stock";

String fetchSupplierClientsUrl = "$baseUrl/provider/clients";
String fetchSupplierRequestUrl = "$baseUrl/provider/requests/list";
String updateRequestStatusUrl = "$baseUrl/provider/requests/update-status";
String fetchSupplierInvoicesUrl = "$baseUrl/provider/invoices/list";
String downloadInvoice = "$baseUrl/invoice-download";

// ////common
String updateBussinessTypesUrl =
    "$baseUrl/provider/profile/update-bussiness-types";
String updateDeviceInfo = "$baseUrl/common/update/device-info";
String isContactExist = "$baseUrl/common/is-contact-exist";

String notificationList = "$baseUrl/common/notifications/list";
String notificationMarkAsRead = "$baseUrl/common/notifications/mark-as-read";
