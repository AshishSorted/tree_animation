// ignore: library_prefixes
import 'package:dio/dio.dart' as DioApi;
import 'package:tree_animation/model/send_otp_request.dart';
import 'package:tree_animation/utils/logger.dart';

import '../network/api_client.dart';
import '../network/api_end_points.dart';


class LoginRepo {
  static Future<bool> postOtp(SendOtpRequest sendOtpRequest) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
          endpoint: ApiEndPoints.authAdminOtp, param: sendOtpRequest);
      if (response.statusCode == 201) {
        logger.d("Not Null response ");
        return true;
      } else {
        logger.d("Null response  ");
        return false;
      }
    } catch (e) {
      logger.e("LoginRepo : : $e");
      throw e.toString();
    }
  }
}
