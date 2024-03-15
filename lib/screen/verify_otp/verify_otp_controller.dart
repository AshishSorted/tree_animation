import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:tree_animation/common/strings.dart';
import 'package:tree_animation/model/verify_otp_request.dart';
import 'package:tree_animation/model/verify_otp_response.dart';
import 'package:tree_animation/network/shared_prefs.dart';
import 'package:tree_animation/repo/verify_otp_repo.dart';
import 'package:tree_animation/utils/logger.dart';


class VerifyOtpController extends GetxController {
  VerifyOtpResponse verifyOtpResponseData = VerifyOtpResponse();
  RxString errorMsg = ''.obs;
  Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;

  Future<String?> verifyOtp(String otp, String phoneNumber) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      VerifyOtpResponse? verifyOtpResponse = await OtpReop.verifyOtp(
          VerifyOtpRequest(otp: otp, phoneNumber: phoneNumber));
      if (verifyOtpResponse != null) {
        logger.d('VerifyOtpController response is not null');
        await SharedPref.setTokens(verifyOtpResponse.accessToken ?? '',
            verifyOtpResponse.refreshToken ?? '');
        await SharedPref.setUserId(
          verifyOtpResponse.user?.id ?? '',
        );
        formzStatus.value = FormzStatus.submissionSuccess;
        return null;
      } else {
        formzStatus.value = FormzStatus.submissionFailure;
        logger.d('VerifyOtpController response is null');
        return Strings.couldntVerifyOtp;
      }
    } catch (e) {
      formzStatus.value = FormzStatus.submissionFailure;
      errorMsg.value = e.toString();
      logger.e("VerifyOtpController : : ${e.toString()}");
      return e.toString();
    }
  }
}
