import 'dart:convert';

import 'package:dio/dio.dart' as DioApi;
import 'package:dio/dio.dart';

import '../common/strings.dart';
import '../model/api_result.dart';
import '../model/user.dart';
import '../network/api_client.dart';
import '../network/api_end_points.dart';
import '../network/service_exception.dart';
import '../screen/main_screen/model/cart_request_model.dart';
import '../screen/main_screen/model/cart_response_model.dart';
import '../screen/main_screen/model/create_order_request_model.dart';
import '../screen/main_screen/model/create_order_response_model.dart';
import '../screen/main_screen/model/order_detail_respinse.dart';
import '../screen/main_screen/model/order_listing_response.dart';
import '../screen/main_screen/model/slot.dart';
import '../screen/main_screen/model/update_cart_request.dart';
import '../utils/logger.dart';

class OrderRepo {
  static Future<ApiResult> getOrders(String? id) async {
    try {
      DioApi.Response response = await ApiClient.getRequest(
        endpoint: '${ApiEndPoints.orderscustomer}/$id',
      );
      if (response.statusCode == 200) {
        List<OrderListingResponseModel> orders =
            List<OrderListingResponseModel>.from(
          response.data.map(
            (e) => OrderListingResponseModel.fromMap(e),
          ),
        );
        return ApiResult.success(data: orders);
      } else {
        logger.d("Null response ");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("getOrders : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> getOrdersDetails(String? orderId) async {
    try {
      DioApi.Response response = await ApiClient.getRequest(
        endpoint: '${ApiEndPoints.orders}/$orderId${ApiEndPoints.backoffice}',
      );
      if (response.statusCode == 200) {
        OrderDetailResponseModel ordersdetails =
            OrderDetailResponseModel.fromJson(response.data ?? {});
        return ApiResult.success(data: ordersdetails);
      } else {
        logger.d("Null response ");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("getOrders : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult?> getUserInfo(String number) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
        endpoint: ApiEndPoints.ordereuser,
        param: {'phone_number': number},
      );

      if (response.statusCode == 201) {
        logger.d("Not null response  ");
        return ApiResult.success(data: User.fromMap(response.data ?? {}));
      } else {
        logger.d("null response");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("OrderRepo : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> updateUser(data, userId) async {
    try {
      DioApi.Response response = await ApiClient.patchRequest(
        endpoint: "${ApiEndPoints.profileUpdate}/$userId",
        param: data,
      );

      if (response.statusCode == 200) {
        logger.d("Not null response  ");
        return ApiResult.success(data: response.data);
      } else {
        logger.d("null response");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("OrderRepo : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<List<SlotAvailability>?> getSlotsList() async {
    try {
      DioApi.Response response =
          await ApiClient.getRequest(endpoint: ApiEndPoints.availableSlots);
      if (response.statusCode == 200) {
        logger.d("Response : ${response.data}");
      } else {
        logger.d("Response is null : ${response.data}");
      }
      var json = jsonEncode(response.data);
      logger.d("Final  : $json");

      return slotsListFromJson(json);
    } on ServiceException catch (e) {
      throw RepoServiceException(message: e.message);
    }
  }

  static Future<ApiResult?> createOrder(
      CreateOrderRequestModel model, storeId) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
          endpoint: ApiEndPoints.creatOrder,
          options: Options(
            headers: {
              "storeId": storeId,
            },
          ),
          param: createOrderModelToJson(model));

      if (response.statusCode == 200) {
        return ApiResult.success(
            data: CreateOrderResponseModel.fromMap(response.data ?? {}));
      } else {
        logger.d("null response");
        return ApiResult.failure(
            error: response.data['message'],
            data: CreateOrderResponseModel.fromMap(response.data ?? {}));
      }
    } catch (e) {
      logger.e("OrderRepo : : $e");

      return ApiResult.failure(
          error: (e as Map)['message'],
          data: CreateOrderResponseModel.fromMap(
              {"message": (e)['message']}));
    }
  }

  static Future<ApiResult> orderRefund(
    String id,
    List<Map<String, dynamic>> list,
  ) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
          endpoint: ApiEndPoints.ordersRefund,
          param: {"parentOrderId": id, "refundOrderItems": list});
      if (response.statusCode == 200) {
        return const ApiResult.success();
      } else {
        logger.d("Null response ");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("postRefundOrder : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> addToCart(
    CartRequest cartRequest,
    int storeId,
  ) async {
    try {
      cartRequest.time = DateTime.now().millisecondsSinceEpoch;
      DioApi.Response response = await ApiClient.postRequest(
        endpoint: ApiEndPoints.cartSummaryV2,
        param: cartRequest.toJson(),
        options: Options(
          headers: {
            "storeId": storeId,
          },
        ),
      );
      if (response.statusCode == 200) {
        return ApiResult.success(data: cartResponseFromJson(response.data));
      } else {
        logger.d("Null response ");
        return ApiResult.failure(error: response.data['message']);
      }
    } catch (e) {
      logger.e("getOrders : : $e");
      return ApiResult.failure(error: e.toString());
    }
  }

  static Future<ApiResult> updateToCart(
      UpdateCartRequest updateCartRequest) async {
    try {
      Response response = await ApiClient.putRequest(
        endpoint: ApiEndPoints.cartSummaryV2,
        param: updateCartRequest.toJson(),
        headers: {
          "storeId": updateCartRequest.storeId,
        },
      );

      if (response.statusCode == 200) {
        logger.d("upDateToCart : ${response.data}");
        // var json = jsonEncode(response.data);
        return const ApiResult.success();
      } else {
        logger.d("upDateToCart Response is null : ${response.data}");
        return ApiResult.failure(error: response.data["message"]);
      }
    } on ServiceException catch (e) {
      throw RepoServiceException(message: e.message);
    }
  }

  static Future<CartResponse?> getCartSummary(
    User customerInfo,
    int storeId,
    String? date,
  ) async {
    try {
      Response response = await ApiClient.getRequest(
        endpoint: ApiEndPoints.cartSummaryV2,
        param: {
          'customerId': customerInfo.id,
          'channel': 'backoffice',
          if (date != null) 'date': date,
        },
        headers: {"storeId": storeId},
      );

      if (response.statusCode == 200) {
        // logger.d("getCartSummary : ${response.data}");
        return cartResponseFromJson(response.data);
      } else {
        // logger.d("getCartSummary Response is null : ${response.data}");
      }
    } on ServiceException catch (e) {
      throw RepoServiceException(message: e.message);
    }
  }

  static Future<ApiResult> getWalletSummary(userId) async {
    try {
      Response response = await ApiClient.getRequest(
        endpoint: ApiEndPoints.getWalletInfo + userId,
      );
      if (response.statusCode == 200) {
        // logger.d("getCartSummary : ${response.data}");
        return ApiResult.success(data: response.data);
      } else {
        return ApiResult.failure(error: response.data["message"]);
      }
    } on ServiceException catch (e) {
      return ApiResult.failure(
        error: e.message ?? Strings.somethingWentWrong,
      );
    }
  }
}
