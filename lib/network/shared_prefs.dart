// ignore_for_file: constant_identifier_names
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String ACCESS_TOKEN = 'ACCESS_TOKEN';
  static const String REFRESH_TOKEN = 'REFRESH_TOKEN';
  static const String CLIENT_ID = 'CLIENT_ID';
  static const String CLIENT_SECRET = 'CLIENT_SECRET';
  static const String TAGS = 'TAGS';
  static const String PARTNER_TAGS = 'PARTNER_TAGS';
  static const String CDN_BASE_URL = 'CDN_BASE_URL';
  static const String VENDOR_CATEGORIES = 'VENDOR_CATEGORIES';
  static const String CONSUMER_GRADES_LIST = 'CONSUMER_GRADES_LIST';
  static const String OFFERS = 'OFFERS';
  static const String WALLET_TXN_TYPE = 'WALLET_TXN_TYPE';
  static const String USER_ROLES_LIST = 'USER_ROLES_LIST';
  static const String CLASSES = 'CLASSES';
  static const String ORDER_ADJUSTMENT_UPLOAD_KEY =
      'ORDER_ADJUSTMENT_UPLOAD_KEY';
  static const String TASK_LIST_UPLOAD_KEY = 'TASK_LIST_UPLOAD_KEY';
  static const String CREDIT_LIMIT_UPLOAD_KEY = 'TASK_LIST_UPLOAD_KEY';
  static const String TARGET_UPLOAD_KEY = 'TARGET_UPLOAD_KEY';
  static const String STORE_USER_MAPPING = 'STORE_USER_MAPPING';
  static const String PAYMENT_REQUESTS_UPLOAD_KEY =
      'PAYMENT_REQUESTS_UPLOAD_KEY';
  static const String FOS_OFFER_LIST_UPLOAD_KEY = 'FOS_OFFER_LIST_UPLOAD_KEY';
  static const String L3_UPLOAD_KEY = 'L3_UPLOAD_KEY';
  static const String OFFER_LIST_UPLOAD_KEY = 'OFFER_LIST_UPLOAD_KEY';
  static const String TARGET_CAMPAIGN_UPLOAD_KEY = 'TARGET_CAMPAIGN_UPLOAD_KEY';
  static const String VOUCHER_LIST_UPLOAD_KEY = 'VOUCHER_LIST_UPLOAD_KEY';
  static const String SKU_PRICE_LIST_UPLOAD_KEY = 'SKU_PRICE_LIST_UPLOAD_KEY';
  static const String INCENTIVE_UPLOAD_SHEET = 'INCENTIVE_UPLOAD_SHEET';
  static const String CONSUMER_INVENTORY_UPLOAD_SHEET = 'CONSUMER_INVENTORY_UPLOAD_SHEET';
  static const String USER_ID = 'USER_ID';

  static Future<SharedPreferences> _getPref() async {
    return await SharedPreferences.getInstance();
  }

  static Future<void> setTokens(String accessToken, String refreshToken) async {
    final pref = await _getPref();
    await pref.setString(ACCESS_TOKEN, accessToken);
    await pref.setString(REFRESH_TOKEN, refreshToken);
  }

  static Future<void> setUserId(String userId) async {
    final pref = await _getPref();
    await pref.setString(USER_ID, userId);
  }

  static Future<void> clearTokens() async {
    final pref = await _getPref();
    await pref.remove(ACCESS_TOKEN);
    await pref.remove(REFRESH_TOKEN);
    await pref.remove(ORDER_ADJUSTMENT_UPLOAD_KEY);
    await pref.remove(PAYMENT_REQUESTS_UPLOAD_KEY);
    await pref.remove(TASK_LIST_UPLOAD_KEY);
    await pref.clear();
  }

  static Future<void> clearSharedPref() async {
    final pref = await _getPref();
    await pref.clear();
  }

  static Future<String?> getAccessToken() async {
    final pref = await _getPref();
    return pref.getString(ACCESS_TOKEN);
  }

  static Future<String?> getUserId() async {
    final pref = await _getPref();
    return pref.getString(USER_ID);
  }

  static Future<String?> getRefreshToken() async {
    final pref = await _getPref();
    return pref.getString(REFRESH_TOKEN);
  }

  static Future<void> setTags(Map? tags) async {
    final pref = await _getPref();
    await pref.setString(TAGS, json.encode(tags));
  }

  static Future<Map?> getTags() async {
    final pref = await _getPref();
    Map? tags;
    String? tagsString = pref.getString(TAGS);
    if (tagsString != null) tags = json.decode(tagsString);
    return tags;
  }

  static Future<void> setPartnerTags(List<Map>? tags) async {
    final pref = await _getPref();
    await pref.setString(PARTNER_TAGS, json.encode(tags));
  }

  static Future<List<Map>?> getPartnerTags() async {
    final pref = await _getPref();
    List<Map>? tags;
    String? tagsString = pref.getString(PARTNER_TAGS);
    if (tagsString != null) {
      tags = List.from(json.decode(tagsString) ?? [])
          .map((e) => e as Map<String, dynamic>)
          .toList();
    }
    return tags;
  }

  static Future<void> setOffers(Map? offers) async {
    final pref = await _getPref();
    await pref.setString(OFFERS, json.encode(offers));
  }

  static Future<Map<String, dynamic>?> getOffers() async {
    final pref = await _getPref();
    Map<String, dynamic>? offers;
    String? offersString = pref.getString(OFFERS);
    if (offersString != null) offers = json.decode(offersString);
    return offers;
  }

  static Future<void> setCDNBaseUrl(String? cdnBaseUrl) async {
    final pref = await _getPref();
    await pref.setString(CDN_BASE_URL, json.encode(cdnBaseUrl));
  }

  static Future<String?> getCDNBaseUrl() async {
    final pref = await _getPref();
    String? cdn;
    String? cdnBaseUrl = pref.getString(CDN_BASE_URL);
    if (cdnBaseUrl != null) cdn = json.decode(cdnBaseUrl);
    return cdn;
  }

  static Future<void> setVendorCategories (String? cdnBaseUrl) async {
    final pref = await _getPref();
    await pref.setString(VENDOR_CATEGORIES, json.encode(cdnBaseUrl));
  }

  static Future<String?> getVendorCategories () async {
    final pref = await _getPref();
    String? cdn;
    String? cdnBaseUrl = pref.getString(VENDOR_CATEGORIES);
    if (cdnBaseUrl != null) {
      cdn = json.decode(cdnBaseUrl);
    }
    return cdn;
  }

  static Future<void> setConsumerGrades (List<String>? cdnBaseUrl) async {
    final pref = await _getPref();
    await pref.setStringList(CONSUMER_GRADES_LIST, (cdnBaseUrl ?? []));
  }

  static Future<List<String>> getConsumerGrades () async {
    final pref = await _getPref();
    List<String>? cdnBaseUrl = pref.getStringList(CONSUMER_GRADES_LIST);
    if (cdnBaseUrl != null) return (cdnBaseUrl);
    return  [
      "raw", "ripe"
    ];
  }

  static Future<void> setTxnTypes(Map<String, dynamic>? txnTypes) async {
    final pref = await _getPref();
    await pref.setString(WALLET_TXN_TYPE, json.encode(txnTypes));
  }

  static Future<Map?> getTxnTypes() async {
    final pref = await _getPref();
    Map? txns;
    String? cdnBaseUrl = pref.getString(WALLET_TXN_TYPE);
    if (cdnBaseUrl != null) txns = json.decode(cdnBaseUrl);
    return txns;
  }

  static Future<void> setUserRolesList(List txnTypes) async {
    final pref = await _getPref();
    await pref.setStringList(
      USER_ROLES_LIST,
      (txnTypes.map((e) => e.toString()).toList()),
    );
  }

  static Future<void> setSubCategories(List categories) async {
    final pref = await _getPref();
    await pref.setStringList(
      CLASSES,
      (categories.map((e) => e.toString()).toList()),
    );
  }

  static Future<List<String>?> getUserRolesList() async {
    final pref = await _getPref();
    return pref.getStringList(USER_ROLES_LIST);
  }

  static Future<List<String>?> getSubCategories() async {
    final pref = await _getPref();
    return pref.getStringList(CLASSES);
  }

  static Future<String?> getOrderAdjustment() async {
    final pref = await _getPref();
    return pref.getString(ORDER_ADJUSTMENT_UPLOAD_KEY);
  }

  static Future<void> setOrderAdjustment(String data) async {
    final pref = await _getPref();
    await pref.setString(ORDER_ADJUSTMENT_UPLOAD_KEY, data);
  }

  static Future<void> removeOrderAdjustmentUploadKey() async {
    final pref = await _getPref();
    await pref.remove(ORDER_ADJUSTMENT_UPLOAD_KEY);
  }

  static Future<String?> getPaymentRequests() async {
    final pref = await _getPref();
    return pref.getString(PAYMENT_REQUESTS_UPLOAD_KEY);
  }

  static Future<void> setPaymentRequests(String data) async {
    final pref = await _getPref();
    await pref.setString(PAYMENT_REQUESTS_UPLOAD_KEY, data);
  }

  static Future<void> removePaymentRequestsUploadKey() async {
    final pref = await _getPref();
    await pref.remove(PAYMENT_REQUESTS_UPLOAD_KEY);
  }

  static Future<String?> getTasksList() async {
    final pref = await _getPref();
    return pref.getString(TASK_LIST_UPLOAD_KEY);
  }

  static Future<void> setTasksList(String data) async {
    final pref = await _getPref();
    await pref.setString(TASK_LIST_UPLOAD_KEY, data);
  }

  static Future<void> removeTasksList() async {
    final pref = await _getPref();
    await pref.remove(TASK_LIST_UPLOAD_KEY);
  }

  static Future<String?> getFosOffersList() async {
    final pref = await _getPref();
    return pref.getString(FOS_OFFER_LIST_UPLOAD_KEY);
  }

  static Future<void> setFosOffersList(String data) async {
    final pref = await _getPref();
    await pref.setString(FOS_OFFER_LIST_UPLOAD_KEY, data);
  }

  static Future<void> removeFosOffersList() async {
    final pref = await _getPref();
    await pref.remove(FOS_OFFER_LIST_UPLOAD_KEY);
  }

  static Future<String?> getL3UploadList() async {
    final pref = await _getPref();
    return pref.getString(L3_UPLOAD_KEY);
  }

  static Future<void> setL3UploadList(String data) async {
    final pref = await _getPref();
    await pref.setString(L3_UPLOAD_KEY, data);
  }

  static Future<void> removeL3UploadList() async {
    final pref = await _getPref();
    await pref.remove(L3_UPLOAD_KEY);
  }

  static Future<String?> getOffersList() async {
    final pref = await _getPref();
    return pref.getString(OFFER_LIST_UPLOAD_KEY);
  }

  static Future<void> setOffersList(String data) async {
    final pref = await _getPref();
    await pref.setString(OFFER_LIST_UPLOAD_KEY, data);
  }

  static Future<void> removeOffersList() async {
    final pref = await _getPref();
    await pref.remove(OFFER_LIST_UPLOAD_KEY);
  }

  static Future<String?> getTargetCampaign() async {
    final pref = await _getPref();
    return pref.getString(TARGET_CAMPAIGN_UPLOAD_KEY);
  }

  static Future<void> setTargetCampaign(String data) async {
    final pref = await _getPref();
    await pref.setString(TARGET_CAMPAIGN_UPLOAD_KEY, data);
  }

  static Future<void> removeTargetCampaign() async {
    final pref = await _getPref();
    await pref.remove(TARGET_CAMPAIGN_UPLOAD_KEY);
  }

  static Future<String?> getSkuPricesList() async {
    final pref = await _getPref();
    return pref.getString(SKU_PRICE_LIST_UPLOAD_KEY);
  }

  static Future<void> setSkuPricesList(String data) async {
    final pref = await _getPref();
    await pref.setString(SKU_PRICE_LIST_UPLOAD_KEY, data);
  }

  static Future<void> removeSkuPricesList() async {
    final pref = await _getPref();
    await pref.remove(SKU_PRICE_LIST_UPLOAD_KEY);
  }

  static Future<String?> getVouchersList() async {
    final pref = await _getPref();
    return pref.getString(VOUCHER_LIST_UPLOAD_KEY);
  }

  static Future<void> setVouchersList(String data) async {
    final pref = await _getPref();
    await pref.setString(VOUCHER_LIST_UPLOAD_KEY, data);
  }

  static Future<void> removeVouchersList() async {
    final pref = await _getPref();
    await pref.remove(VOUCHER_LIST_UPLOAD_KEY);
  }

  static Future<String?> getTargetList() async {
    final pref = await _getPref();
    return pref.getString(TARGET_UPLOAD_KEY);
  }

  static Future<void> setTargetList(String data) async {
    final pref = await _getPref();
    await pref.setString(TARGET_UPLOAD_KEY, data);
  }

  static Future<void> removeTargetList() async {
    final pref = await _getPref();
    await pref.remove(TARGET_UPLOAD_KEY);
  }

  static Future<String?> getIncentiveList() async {
    final pref = await _getPref();
    return pref.getString(INCENTIVE_UPLOAD_SHEET);
  }

  static Future<void> setIncentiveList(String data) async {
    final pref = await _getPref();
    await pref.setString(INCENTIVE_UPLOAD_SHEET, data);
  }

  static Future<void> removeIncentiveList() async {
    final pref = await _getPref();
    await pref.remove(INCENTIVE_UPLOAD_SHEET);
  }

  static Future<String?> getConsumerInventoryList() async {
    final pref = await _getPref();
    return pref.getString(CONSUMER_INVENTORY_UPLOAD_SHEET);
  }

  static Future<void> setConsumerInventoryList(String data) async {
    final pref = await _getPref();
    await pref.setString(CONSUMER_INVENTORY_UPLOAD_SHEET, data);
  }

  static Future<void> removeConsumerInventoryList() async {
    final pref = await _getPref();
    await pref.remove(CONSUMER_INVENTORY_UPLOAD_SHEET);
  }

  static Future<String?> getStoreUserMapping() async {
    final pref = await _getPref();
    return pref.getString(STORE_USER_MAPPING);
  }

  static Future<void> setStoreUserMapping(String data) async {
    final pref = await _getPref();
    await pref.setString(STORE_USER_MAPPING, data);
  }

  static Future<void> removeStoreUserMapping() async {
    final pref = await _getPref();
    await pref.remove(STORE_USER_MAPPING);
  }

  static Future<String?> getCreditLimitList() async {
    final pref = await _getPref();
    return pref.getString(CREDIT_LIMIT_UPLOAD_KEY);
  }

  static Future<void> setCreditLimitList(String data) async {
    final pref = await _getPref();
    await pref.setString(CREDIT_LIMIT_UPLOAD_KEY, data);
  }

  static Future<void> removeCreditLimitList() async {
    final pref = await _getPref();
    await pref.remove(CREDIT_LIMIT_UPLOAD_KEY);
  }
}
