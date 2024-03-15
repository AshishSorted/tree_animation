import 'package:dio/dio.dart' as dio_api;

import '../common/strings.dart';
import '../model/api_result.dart';
import '../network/api_client.dart';
import '../network/api_end_points.dart';
import '../screen/main_screen/model/address.dart';
import '../utils/logger.dart';

class AddressRepo {
  static Future<String?> postAddress(Address address, String customerId) async {
    try {
      dio_api.Response response = await ApiClient.postRequest(
        endpoint: '${ApiEndPoints.addAddress}?customerId=$customerId',
        param: address.toMap(latneed: true),
      );
      if (response.statusCode == 201) {
        logger.d("Not Null response ");
        return null;
      } else {
        logger.d("Null response ");
        return Strings.couldntAddAddress;
      }
    } catch (e) {
      logger.e("AddressRepo : : $e");
      return e.toString();
    }
  }

  static Future<String?> patchAddress(Address address) async {
    try {
      dio_api.Response response = await ApiClient.patchRequest(
        endpoint: "${ApiEndPoints.updateAddress}/${address.id}",
        param: address.toMap(updateAddress: true),
      );
      if (response.statusCode == 200) {
        return null;
      } else {
        return Strings.couldntAddAddress;
      }
    } catch (e) {
      return e.toString();
    }
  }

  // static Future<List<AutoCompleteResponse>?> autoCompleteAPI(
  //     String query) async {
  //   try {
  //     Response response = await ApiClient.postRequest(
  //         endpoint: ApiEndPoints.autoComplete, param: {"input": query});
  //     if (response.statusCode == 200) {
  //       logger.d("Response : ${response.data}");
  //       var json = jsonEncode(response.data);
  //       return autoCompleteResponseListFromJson(json);
  //     } else {
  //       logger.d("Null response ");
  //       return null;
  //     }
  //   } catch (e) {
  //     logger.e("AddressRepo : : $e");
  //     return null;
  //   }
  // }

  // static Future<AddressLocation?> getAddressLocation(String placeId) async {
  //   try {
  //     Response response = await ApiClient.postRequest(
  //         endpoint: ApiEndPoints.geoCordinates, param: {"placeId": placeId});
  //     if (response.statusCode == 200) {
  //       logger.d("Response : ${response.data}");
  //       var json = jsonEncode(response.data);
  //       return addressLocationFromJson(json);
  //     } else {
  //       logger.d("Null response ");
  //       return null;
  //     }
  //   } catch (e) {
  //     logger.e("AddressRepo : : $e");
  //     return null;
  //   }
  // }

  static Future<ApiResult> getUserAddresses(String id) async {
    try {
      dio_api.Response response = await ApiClient.getRequest(
        endpoint: '${ApiEndPoints.addreslist}/$id',
      );
      if (response.statusCode == 200) {
        if (response.data.isNotEmpty) {
          List<Address> addreslist =
              List<Address>.from(response.data.map((e) => Address.fromMap(e)))
              .where((element) => element.is_active == true && element.societyId != null)
                  .toList();
          logger.d("Not null response  ");
          if (addreslist.isEmpty) {
            return const ApiResult.failure(
                error: 'User Does Not Have Any Active Addresses. Please add a New Address');
          }
          return ApiResult.success(data: addreslist);
        } else {
          logger.d(" null response  ");
          return const ApiResult.failure(
              error: 'User Does Not Have Any Addresses. Please add a New Address');
        }
      } else {
        logger.d(" null response  ");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("Address Repo : Get Address : $e");
      return ApiResult.failure(error: e.toString());
    }
  }
}
