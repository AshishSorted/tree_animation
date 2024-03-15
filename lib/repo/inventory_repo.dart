import 'package:dio/dio.dart';

import '../common/strings.dart';
import '../model/api_result.dart';
import '../network/api_client.dart';
import '../network/api_end_points.dart';
import '../screen/main_screen/model/inventory.dart';
import '../screen/main_screen/model/inventory_list_response_model.dart';
import '../utils/logger.dart';

class InventoryRepo {
  // static Future<String?> postInventory(
  //     PostInventoryRequestModel postInventoryRequestModel) async {
  //   try {
  //     Response response = await ApiClient.postRequest(
  //       endpoint: ApiEndPoints.inventory,
  //       param: postInventoryRequestModel.toMap(),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       logger.d("Not null response in Inventory");
  //       return null;
  //     } else {
  //       logger.d("Null response in Inventory");
  //       return Strings.couldntAddInventory;
  //     }
  //   } catch (e) {
  //     logger.e("Inventory : : $e");
  //     return e.toString();
  //   }
  // }

  // static Future<String?> patchInventory(
  //     PostInventoryRequestModel postInventoryRequestModel, String id) async {
  //   try {
  //     Response response = await ApiClient.patchRequest(
  //       endpoint: "${ApiEndPoints.inventory}/$id",
  //       param: postInventoryRequestModel.toMap(),
  //     );
  //
  //     if (response.statusCode == 200) {
  //       logger.d("Not null response in Inventory");
  //       return null;
  //     } else {
  //       logger.d("Null response in Inventory");
  //       return Strings.couldntAddInventory;
  //     }
  //   } catch (e) {
  //     logger.e("Inventory : : $e");
  //     return e.toString();
  //   }
  // }

  // static Future<String?> postInventoryXLSX(FileName fileName) async {
  //   try {
  //     Response response = await ApiClient.postRequest(
  //       endpoint: ApiEndPoints.inventoryXLSX,
  //       param: fileName.toMap(),
  //     );
  //
  //     if (response.statusCode == 201) {
  //       logger.d("Not null response in Inventory");
  //       return null;
  //     } else {
  //       logger.d("Null response in Inventory");
  //       return Strings.couldntAddInventory;
  //     }
  //   } catch (e) {
  //     logger.e("Inventory : : $e");
  //     return e.toString();
  //   }
  // }

  static Future<List<InventoryResponseModel>?> getInventory(
      String storeId) async {
    try {
      Response response = await ApiClient.getRequest(
        endpoint: "${ApiEndPoints.getInventory}/$storeId",
      );

      if (response.statusCode == 200) {
        logger.d("Not null response in Inventory");
        // print("With Data");
        return List<InventoryResponseModel>.from(
          (response.data).map(
            (e) => InventoryResponseModel.fromMap(e),
          ),
        );
      } else {
        logger.d("Null response in Inventory");
        return null;
      }
    } catch (e) {
      logger.e("Inventory Repo  : : $e");
      return null;
    }
  }

  static Future updateMultipleItems(List<Map<String, dynamic>> newData) async {
    try {
      Response response = await ApiClient.postRequest(
        endpoint: ApiEndPoints.inventoryBulkUpdate,
        param: {"MultipleSkus": newData},
      );

      if (response.statusCode == 201) {
        logger.d("Update successful");

        return const ApiResult.success();
      } else {
        logger.d("Update Failed");
        return const ApiResult.failure(error: Strings.somethingWentWrong);
      }
    } catch (e) {
      logger.e("Bulk Update : $e");
      return ApiResult.failure(
        error: (e as Map)['message'],
      );
    }
  }

  static Future<ApiResult> getInventoryList({
    // required num long,
    // required num lat,
    required int storeId,
  }) async {
    try {
      Response response = await ApiClient.getRequest(
          endpoint: ApiEndPoints.inventoryV3,
          headers: {
            'storeId': storeId,
          });
      if (response.statusCode == 200) {
        return ApiResult.success(
          data: response.data == null
              ? null
              : InventoryListResponseModel.fromMap(response.data),
        );
      } else {
        logger.d("Response is null : ${response.data}");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("Inventory  : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> getAddntProductDetails(
      {required String skuCode, required String storeId}) async {
    try {
      Response response = await ApiClient.getRequest(
          endpoint: ApiEndPoints.addntProductsInfo,
          param: {
            "skuCode": skuCode,
            "storeId": storeId,
          });
      if (response.statusCode == 200) {
        return ApiResult.success(data: response.data);
      } else {
        return ApiResult.failure(error: response.data["message"]);
      }
    } catch (e) {
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> getGradesData() async {
    try {
      Response response = await ApiClient.getRequest(
        endpoint: ApiEndPoints.getGrades,
      );
      if (response.statusCode == 200) {
        return ApiResult.success(data: response.data);
      } else {
        return ApiResult.failure(error: response.data["message"]);
      }
    } catch (e) {
      return ApiResult.failure(error: e.toString());
    }
  }
}
