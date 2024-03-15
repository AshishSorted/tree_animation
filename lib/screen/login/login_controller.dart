// import 'package:formz/formz.dart';
// import 'package:get/get.dart';
//
// class LogInController extends GetxController {
//   RxString errorMsg = ''.obs;
//   Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;
//   // final SidebarController sidebarController = Get.find();
//
//   Future<String?> sendOtp(String countryCode, String phoneNumber) async {
//     try {
//       formzStatus.value = FormzStatus.submissionInProgress;
//       bool otpSend = await LoginRepo.postOtp(
//           SendOtpRequest(countryCode: countryCode, phoneNumber: phoneNumber));
//       if (otpSend) {
//         logger.d('OTP send successfully');
//         formzStatus.value = FormzStatus.submissionSuccess;
//         sidebarController.currentRoute.value = Routes.verifyOtp;
//         AppPages.toNextScreen(Routes.verifyOtp, arguments: phoneNumber);
//         return null;
//       } else {
//         formzStatus.value = FormzStatus.submissionFailure;
//         logger.d('Otp failed');
//         return Strings.couldntSendOtp;
//       }
//     } catch (e) {
//       formzStatus.value = FormzStatus.submissionFailure;
//       errorMsg.value = e.toString();
//       logger.e("LogInController Error: : ${e.toString()}");
//       return e.toString();
//     }
//   }
// }
