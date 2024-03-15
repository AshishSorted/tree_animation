import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:tree_animation/repo/app_config_repo.dart';
import 'package:tree_animation/screen/app_config/model/config_request_model.dart';
import 'package:tree_animation/screen/app_config/model/config_response_model.dart';


class AppAddConfigController extends GetxController {
  RxList<ConfigResponseModel> configs = <ConfigResponseModel>[].obs;
  Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;

  Future<void> getAppConfig() async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      List<ConfigResponseModel>? res = await AppConfigRepo.getConfig();
      if (res != null) {
        configs.value = res;
        formzStatus.value = FormzStatus.submissionSuccess;
      } else {
        formzStatus.value = FormzStatus.submissionFailure;
      }
    } catch (e) {
      formzStatus.value = FormzStatus.submissionFailure;
    }
  }

  Future<String?> postAppConfig(AppConfigRequest appConfigRequest) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      String? error = await AppConfigRepo.postConfig(appConfigRequest);
      if (error == null) {
        formzStatus.value = FormzStatus.submissionSuccess;
        return null;
      } else {
        formzStatus.value = FormzStatus.submissionFailure;
        return error;
      }
    } catch (e) {
      formzStatus.value = FormzStatus.submissionFailure;
      return e.toString();
    }
  }
}
