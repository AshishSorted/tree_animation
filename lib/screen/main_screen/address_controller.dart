import 'package:formz/formz.dart';
import 'package:get/get.dart';

import '../../common/strings.dart';
import '../../model/api_result.dart';
import '../../network/service_exception.dart';
import '../../repo/address_repo.dart';
import '../../repo/society_repo.dart';
import '../../utils/logger.dart';
import 'model/address.dart';
import 'model/society.dart';

class AddAddressController extends GetxController {
  Rx<FormzStatus> formzStatus = FormzStatus.pure.obs;
  Rx<FormzStatus> lodesuggestionformzStatus = FormzStatus.pure.obs;
  Rxn<Address> address = Rxn<Address>();
  RxList<SocietyModel> societyList = <SocietyModel>[].obs;
  RxList<Tower> selectedTowers = <Tower>[].obs;
  // RxList<AutoCompleteResponse> listSuggestions = <AutoCompleteResponse>[].obs;
  RxList<Address> userAddresses = <Address>[].obs;
  // Rxn<AddressLocation> addressLocation = Rxn<AddressLocation>();
  RxString errorMessage = "".obs;

  @override
  void onInit() {
    getSocietyData();
    super.onInit();
  }
  //
  // Future autoCompleteSearch(String query) async {
  //   try {
  //     lodesuggestionformzStatus.value = FormzStatus.submissionInProgress;
  //     List<AutoCompleteResponse>? suggestions =
  //     await AddressRepo.autoCompleteAPI(query);
  //     if (suggestions != null) {
  //       logger.d('Post Address  response is not null');
  //       formzStatus.value = FormzStatus.submissionSuccess;
  //       listSuggestions.value = suggestions;
  //     } else {
  //       logger.d('Post Address  response is null');
  //       formzStatus.value = FormzStatus.submissionFailure;
  //       return Strings.somethingWentWrong;
  //     }
  //   } catch (e) {
  //     logger.d('Post Address  response is null');
  //     formzStatus.value = FormzStatus.submissionFailure;
  //     return e.toString();
  //   }
  // }
  //
  // Future getAddressLocation(String placeId) async {
  //   try {
  //     AddressLocation? suggestions =
  //     await AddressRepo.getAddressLocation(placeId);
  //     if (suggestions != null) {
  //       logger.d('Post Address  response is not null');
  //       formzStatus.value = FormzStatus.submissionSuccess;
  //       addressLocation.value = suggestions;
  //     } else {
  //       logger.d('Post Address  response is null');
  //       formzStatus.value = FormzStatus.submissionFailure;
  //       return Strings.somethingWentWrong;
  //     }
  //   } catch (e) {
  //     logger.e("Address  : : ${e.toString()}");
  //     formzStatus.value = FormzStatus.submissionFailure;
  //     return e.toString();
  //   }
  // }

  Future<String?> creatNewAddress({required String customerId}) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      String? error = await AddressRepo.postAddress(address.value!, customerId,);
      if (error == null) {
        logger.d('Post Address  response is not null');
        formzStatus.value = FormzStatus.submissionSuccess;
        return null;
      } else {
        logger.d('Post Address  response is null');
        formzStatus.value = FormzStatus.submissionFailure;
        return error;
      }
    } catch (e) {
      logger.e("Address  : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
      return e.toString();
    }
  }

  int getStoreIdBySocietyId(int societyId) {
    SocietyModel? society =
    societyList.firstWhereOrNull((element) => element.id == societyId);
    print("Society List: ");
    return society != null ? int.parse(society.storeId!) : 0;
  }

  Future<void> getSocietyData() async {
    try {
      SocietyModelResponse? societyResponse =
      await SocietyRepo.getSocietyList();
      if (societyResponse != null) {
        societyList.value = societyResponse.data ?? [];

        logger.d("Society List :$societyList");
      } else {
        logger.d("Society List :${Strings.someThingWentWrong}");
      }
    } on RepoServiceException catch (e) {
      logger.e(e.message);
      errorMessage.value = e.message!;
    }
  }

  Future<String?> patchAddress(Address address) async {
    try {
      formzStatus.value = FormzStatus.submissionInProgress;
      String? error = await AddressRepo.patchAddress(address);
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

  Future<String?> getUserAddresses(String id) async {
    try {
      userAddresses.value = [];
      formzStatus.value = FormzStatus.submissionInProgress;
      ApiResult addreslist = await AddressRepo.getUserAddresses(id);
      if (addreslist is Success) {
        formzStatus.value = FormzStatus.submissionSuccess;
        userAddresses.value = addreslist.data;
        address.value ??= userAddresses.value.firstWhereOrNull((element) => element.is_active == true);
        logger.d('Post Address  response is not null');
        return null;
      } else {
        logger.d('Post Address  response is null');
        formzStatus.value = FormzStatus.submissionFailure;
        return addreslist is Failure ? addreslist.error : null;
      }
    } catch (e) {
      logger.e("Address  : : ${e.toString()}");
      formzStatus.value = FormzStatus.submissionFailure;
      return e.toString();
    }
  }
}
