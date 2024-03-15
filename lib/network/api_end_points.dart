class ApiEndPoints {
  static bool isInitialised = false;

  // static String baseUrl = 'https://consumerapp.livesorted.com';
  static String baseUrl = 'https://consumerapp-dev.livesorted.com';
  static const String initConfig = '/util/config/get/web';
  static const String authAdminOtp = '/auth/admin/otp';
  static const String authAdminVerifyOtp = '/auth/admin/verify-otp';
  static const String productsRequest = '/store-app/products';
  static const String addntProductsInfo = '/store-app/inventory/warehouse';
  static const String getGrades = '/store-app/backoffice/inventory/grades';
  static const String mediaPublic = '/util/media/public';
  static const String mediaPrivate = '/util/media/private';
  static String availableSlots = '/orders/slots';
  static const String store = '/store-app/store';
  static String societyList = '/auth/society';
  static const String l3StoreMapping = '/auth/am-store-mapping';
  static const String userManagerMapping = '/auth/user-manager-mapping';
  static const String storeCategories = '/store-app/store/categories';
  static const String inventory = '/store-app/inventory';
  static const String inventoryV3 = '/store-app/inventory/v3/backoffice';
  static String cartSummaryV2 = '/orders/cart/v2';
  static const String getInventory = '/store-app/inventory';
  static const String inventoryBulkUpdate = '/store-app/inventory/bulk';
  static const String addreslist = '/auth/internal/addresses/user';
  static const String ordereuser = '/auth/internal/user';
  static const String createUser = '/auth/internal/user';
  static const String profileUpdate = '/auth/user';
  static const String creatOrder = '/orders/backoffice';
  static const String inventoryXLSX = '/store-app/inventory/xlsx';
  static const String category = '/store-app/categories';
  static const String appConfig = '/util/config';
  static const String autoComplete = '/util/geo/auto-complete';
  static const String getCoupon = '/offers/fetch/backoffice';
  static const String geoCordinates = '/util/geo/cordinates';
  static const String addAddress = '/auth/addresses/v2/backoffice';
  static const String updateAddress = '/auth/admin/addresses';
  static const String orderscustomer = '/orders/customer';
  static const String updateEta = '/orders/params/additional-buffer-time';
  static const String orders = '/orders';
  static const String voucherCreate = '/offers/voucher/create';
  static const String getWalletInfo = '/payments/wallet/USER/';

  // static const String paymentWalletAddUser = '/payments/wallet/add/USER';
  static const String backoffice = '/backoffice';
  static const String offer = '/offers/create';
  static const String ordersRefund = '/orders/refund';
  static const String walletRefund = '/payments/admin/walletStatement/USER/';
  static const String storeRefund = '/payments/admin/walletStatement/STORE/';
  static const String postWalletStore = '/payments/requests/STORE';
  static const String postWalletUser = '/payments/requests/USER';

  ///Store Order apis
  static const String getStoreInfo =
      '/store-app/franchise-store?isBackOfficeRequest=1';
  static const String fetchStoresList = '/store-app/franchise-stores';
  static const String createFranchiseOrder = '/orders/franchise/backoffice';
  static const String uploadFranchiseOrder =
      '/orders/franchise/backoffice/upload';
  static const String franchiseStoreOrders = '/orders/franchise/store';
  static const String franchiseStorePendingRefunds =
      '/orders/franchise/admin/pending-refunds';
  static const String franchiseStoreCancelPendingRefunds =
      '/orders/franchise/admin/refund';
  static const String franchiseOrders = '/orders/franchise';
  static const String franchiseRefundRequest =
      '/orders/franchise/admin/initiate-refund';
  static const String confirmFranchiseRefundRequest =
      '/orders/franchise/admin/confirm-refund';
  static const String getFranchiseReundedOrders =
      '/orders/franchise/admin/refund-orders';
  static const String processFranchiseOrders = '/orders/franchise/cart/process';
  static const String createInvoiceFranchise = '/orders/invoices/franchise';
  static const String createFranchise = '/orders/franchise';

  ///Zone Services API
  static const String getZonesListing = '/store-app/zones';
  static const String saveZone = '/store-app/zones';

  //Reject Zone APIS
  static const String getRejectOrders = '/orders/rejection/backoffice?status=1';
  static const String getOrderAdjustments = '/orders/adjustment/backoffice';
  static const String getCashCollections = '/payments/cash-collections/';
  static const String getConsumerCashCollections =
      '/payments/consumer/cash-collections';
  static const String confirmCashCollections =
      '/payments/cash-collections/approve';
  static const String confirmOrderAdjustments = '/orders/adjustment/backoffic'
      'e/confirm';
  static const String getRejectOrderDetails = '/orders/rejection/backoffice';
  static const String createRejectOrder =
      '/orders/rejection/backoffice/place-order';

  // static const String fetchRejectOrderStores =
  //     '/store-app/store?is_active=1&store_type=SECONDARY';
  static const String fetchRejectOrderStores = '/store-app/store';
  static const String uploadQuantitySheet =
      '/orders/rejection/backoffice/quantity-upload';
  static const String confirmPricingSheet =
      '/orders/rejection/backoffice/pricing';

  static const String fetchWarehouse = '/store-app/store/warehouse-list';

  static const String getUserStores = '/auth/admin/user';
  static const String getUserManagerMapping = '/auth/user-manager-mapping';
  static const String collectionsService = '/collections';
  static const String uploadTagsCsv = '/store-app/products/upload/tags';

  static const String getPaymentRequests = '/payments/requests';
  static const String uploadPaymentRequestsSheets =
      '/payments/requests/store/upload';
  static const String confirmPaymentRequests = '/payments/requests/approve';
  static const String getStoreCreditDetails = '/payments/wallet/';
  static const String setStoreCreditDetails =
      '/payments/wallet/creditLimit/STORE';
  static const String storeEaseBuzzVirtualAccount =
      '/store-app/store/easebuzz/virtual-account';
  static const String getWidgetsPaginated = '/widgets';
  static const String widgetService = '/widgets';

  static const String surveyServices = '/surveys';
  static const String taskServices = '/tasks';
  static const String uploadTasksSheets = '/tasks/store/backoffice/upload';
  static const String saveTasksSheets = '/tasks/store/backoffice';

  static const String uploadFosOffersSheets = '/fos/offers/upload';

  static const String uploadL3Sheets = '/targets/store/upload';

  static const String saveFosOffersSheets = '/fos/offers/upload/save';
  static const String saveL3Sheets = '/targets/store/saveOrCancel';

  static String refresh = '/auth/refresh';
  static const String uploadOffersSheets = '/offers/admin/offers/bulk-upload';
  static const String saveOffersSheets =
      '/offers/admin/offers/bulk-upload/confirm';

  static const String uploadVouchersSheets =
      '/offers/admin/vouchers/bulk-upload';
  static const String saveVouchersSheets =
      '/offers/admin/vouchers/bulk-upload/confirm';

  static const String uploadSkuPurchaseSheets =
      '/orders/skus-purchase-cost/upload';
  static const String saveSkuPurchaseSheets =
      '/orders/skus-purchase-cost/upload/save';

  static const String uploadTargetsSheet = '/targets/store/backoffice/upload';
  static const String saveTargetsSheet =
      '/targets/store/backoffice/saveOrCancel';
  static const String uploadUserStoreMapping =
      '/auth/admin/user-store-mapping/bulk-upload';
  static const String saveUserStoreMapping =
      '/auth/admin/user-store-mapping/bulk-upload/confirm';
  static const String getTargetsList = '/targets';
  static const String updateGoal = '/targets/goals';

  static const String uploadIncentiveSheet = '/fos/incentive/upload';
  static const String saveIncentiveSheet = '/fos/incentive/upload/saveOrCancel';
  static const String uploadConsumerInventorySheet =
      '/store-app/backoffice/inventory/upload';
  static const String saveConsumerInventorySheet =
      '/store-app/backoffice/inventory/upload/save';
  static const String updateUser = '/auth/user/backoffice';
  static const String getPriceRequests =
      '/store-app/backoffice/inventory-request/pending';
  static const String updatePriceRequest =
      '/store-app/backoffice/inventory-request/approve';

  static const String uploadCreditLimitSheets =
      '/payments/wallet/creditLimit/backoffice/upload';
  static const String saveCreditLimitSheets =
      '/payments/wallet/creditLimit/backoffice/upload/save';

  static const String uploadTargetCampaign = '/offers/targets/campaigns/upload';
  static const String saveTargetCampaign =
      '/offers/targets/campaigns/upload/save';
  static const String getTargetCampaigns = '/offers/targets/campaigns';
  static const String uploadStoreImage = '/store-app/store/upload/images';
  static const String nearByStore = '/store-app/franchise/nearby-stores';
  static const String templatesList = '/notification/template';

  static const String markApproveDuplicate =
      '/store-app/store/backoffice/approve';
  static const String uploadVideo = '/store-app/products/upload/videos';
  static const String downloadTargetCampaignSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/Cashback_target_sample.csv';
  static const String downloadOfferSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/Create_Offers_sample.csv';
  static const String downloadStoreVoucherSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/Create_Vouchers_sample.csv';
  static const String downloadUserMappingSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/User_Store_Mapping_Sample.csv';
  static const String downloadTargetListSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/Cashback_target_sample.csv';
  static const String downloadSKUPurchasesSample =
      'https://d69ugcdrlg41w.cloudfront.net/upload_samples/consumer/SKU_Price_Sample.csv';
}
