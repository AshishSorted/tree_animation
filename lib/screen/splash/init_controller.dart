import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tree_animation/network/shared_prefs.dart';
import 'package:tree_animation/repo/init_repo.dart';
import 'package:tree_animation/routes/app_pages.dart';
import 'package:tree_animation/screen/app_config/model/config_response_model.dart';
import 'package:tree_animation/utils/logger.dart';


class InitController extends GetxController {
  ConfigResponseModel configResponse = ConfigResponseModel();
  String? error;

  Future<void> getInitConfig(BuildContext context) async {
    try {
      ConfigResponseModel? response = await InitRepo.getInitConfig();
      if (response != null) {
        configResponse = response;
        await SharedPref.setTags(response.config?['tags']);
        await SharedPref.setPartnerTags(
          List.from(response.config?['PARTNER_CONTENT'] ?? [])
              .map((e) => e as Map)
              .toList(),
        );
        await SharedPref.setOffers(response.config?['offers']);
        await SharedPref.setCDNBaseUrl(response.config?['CDN_BASE_URL']);
        await SharedPref.setVendorCategories(response.config?['VENDOR_CATEGORIES']);
        await SharedPref.setConsumerGrades(List.from(response.config?['CONSUMER_PRODUCT_GRADES']).map((e) => e.toString()).toList());
        await SharedPref.setTxnTypes(response.config?['WALLET_TXN_TYPE']);
        await SharedPref.setUserRolesList(response.config?['USER_ROLES']);
        await SharedPref.setSubCategories(response.config?['CLASSES']);
        AppPages.toNextScreen(Routes.home);
      } else {
        logger.d('init response is null');
      }
    } catch (e) {
      logger.e("InitController : : ${e.toString()}");
      error = e.toString();
    }
  }
}
