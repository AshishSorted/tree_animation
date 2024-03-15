
// ignore: library_prefixes
import 'package:dio/dio.dart' as DioApi;
import 'package:tree_animation/model/verify_otp_request.dart';
import 'package:tree_animation/model/verify_otp_response.dart';
import 'package:tree_animation/network/api_client.dart';
import 'package:tree_animation/utils/logger.dart';

import '../network/api_end_points.dart';

class OtpReop {
  static Future<VerifyOtpResponse?> verifyOtp(
      VerifyOtpRequest verifyOtpRequest) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
          endpoint: ApiEndPoints.authAdminVerifyOtp, param: verifyOtpRequest.toJson());
      if (response.statusCode == 201) {
        logger.d("Not Null response ");
      } else {
        logger.d("Null response ");
      }
      return VerifyOtpResponse.fromMap(response.data ?? {});
    } catch (e) {
      logger.e("LoginRepo : : $e");
      throw e.toString();
    }
  }
}
