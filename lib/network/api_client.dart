import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as get_;
import 'package:tree_animation/screen/splash/splash_screen.dart';
import '../common/strings.dart';

import '../utils/logger.dart';
import 'api_end_points.dart';
import 'shared_prefs.dart';

class ApiClient {
  static late Dio _dio;
  static String appId = 'com.sorted.admin_portal';

  static final LogInterceptor _logInterceptor = LogInterceptor(
      responseBody: false,
      requestHeader: false,
      responseHeader: false,
      request: false,
      error: true,
      requestBody: false,
      logPrint: (obj) =>
          logger.i(obj is Map ? jsonEncode(obj) : obj.toString()));

  static dynamic _requestInterceptor(
      RequestOptions request, RequestInterceptorHandler handler) async {
    String accessToken = await SharedPref.getAccessToken() ?? '';
    if (accessToken.isNotEmpty) {
      if (expiredToken(accessToken)) {
        String? err = await refreshToken();
        if (err != null) {
          await clearTokenAndLogout();
        }
        accessToken = await SharedPref.getAccessToken() ?? '';
      }
    }
    request.headers['authorization'] =
        accessToken.isNotEmpty ? 'Bearer $accessToken' : '';
    request.headers['appId'] = appId;
    return handler.next(request);
  }

  static retryRequest(DioException e, ErrorInterceptorHandler handler) async {
    final opts = Options(
        method: e.requestOptions.method, headers: e.requestOptions.headers);
    final cloneReq = await _dio.request(e.requestOptions.path,
        options: opts,
        data: e.requestOptions.data,
        queryParameters: e.requestOptions.queryParameters);

    return handler.resolve(cloneReq);
  }

  static Future<void> init() async {
    var option = BaseOptions(baseUrl: ApiEndPoints.baseUrl);
    _dio = Dio(option);
    _dio.interceptors.add(_logInterceptor);
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (request, handler) => _requestInterceptor(request, handler),
        onError: (e, handler) async {
          if (e.response?.statusCode == 401) {
            // String? err = await refreshToken();

            // if (err == null) {
            //   retryRequest(e, handler);
            // } else {
            //   await clearTokenAndLogout();
            // }
          } else if (e.response?.statusCode == 469) {
            await clearTokenAndLogout();
          } else {
            handler.next(e);
          }
        },
      ),
    );
  }

  static bool expiredToken(String token) {
    final encodedPayload = token.split('.')[1];
    final payloadData =
        utf8.fuse(base64).decode(base64.normalize(encodedPayload));
    int exp = jsonDecode((payloadData))['exp'];
    DateTime expiryDateTime = DateTime.fromMillisecondsSinceEpoch(exp * 1000);

    if (expiryDateTime.isBefore(DateTime.now())) {
      // Token has already expired
      return true;
    }

    int mins = expiryDateTime.difference(DateTime.now()).inMinutes;
    return mins < 60;
  }

  static clearTokenAndLogout() async {
    await SharedPref.clearTokens();
    get_.Get.offAll(const SplashScreen());
  }

  //get request
  static Future<dynamic> getRequest({endpoint, param, headers}) async {
    try {
      logger.e("REQUEST END POINT : $endpoint");

      Response response = await _dio.get(endpoint,
          queryParameters: param, options: Options(headers: headers));
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("SEND TIMEOUT123");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  //post request
  static Future<dynamic> postRequest(
      {required endpoint, param = const {"": ""}, Options? options}) async {
    try {
      logger.d("--------------------");
      Response response =
          await _dio.post(endpoint, data: param, options: options);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("unknown ERROR: ${e.message}");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  static Future<dynamic> postRequest2(
      {required endpoint,
      param = const {"": ""},
      queryParams = const {}}) async {
    try {
      logger.d("--------------------");
      Response response = await _dio.post(
        endpoint,
        data: param,
        queryParameters: queryParams,
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("unknown ERROR: ${e.message}");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  //multipart request
  static Future<dynamic> multipartRequest(
      {required endpoint,
      required FormData formData,
      Map<String, dynamic>? params = const {}}) async {
    try {
      logger.d("--------------------");

      Response response = await _dio.post(
        endpoint,
        queryParameters: params,
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("SEND TIMEOUT123: ${e.message}");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  static Future<dynamic> multipartRequest2(
      {required endpoint, required FormData formData}) async {
    try {
      logger.d("--------------------");

      Response response = await _dio.post(endpoint,
          data: formData, options: Options(contentType: 'multipart/form-data'));
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("SEND TIMEOUT123: ${e.message}");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data?['errors']?[0]?['msg'];
      }
    }
  }

  //post request
  static Future<dynamic> postRequest1(
      {required endpoint, param = const {"": ""}}) async {
    try {
      logger.d("--------------------");
      Response response = await _dio.post(endpoint, data: param);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("SEND TIMEOUT123");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data;
      }
    }
  }

  //patch request
  static Future<dynamic> patchRequest(
      {required endpoint, param = const {"": ""}, Options? options}) async {
    try {
      logger.d("--------------------");
      Response response =
          await _dio.patch(endpoint, data: param, options: options);
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("SEND TIMEOUT123");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  //put request
  static Future<dynamic> putRequest(
      {required endpoint,
      param = const {"": ""},
      id,
      Map<String, dynamic>? headers}) async {
    try {
      logger.d("--------------------");
      logger.d("REQUEST TYPE : PUT ");
      logger.d("REQUEST END POINT : $endpoint/$id");
      logger.d("REQUEST DATA : $param");

      Response response = await _dio.put(
        endpoint + "/" + (id ?? "").toString(),
        data: param,
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 400) {
        logger.e("DIO : 400 : Bad Request");
      } else if (response.statusCode == 401) {
        logger.e("DIO : 401 : Unauthorized");
      } else if (response.statusCode == 403) {
        logger.e("DIO : 403 : Forbidden");
      } else if (response.statusCode == 404) {
        logger.e("DIO : 404 : Not Found");
      } else if (response.statusCode == 422) {
        logger.e("DIO : 403 : Forbidden");
      } else {
        logger.e("DIO : ${response.statusCode} : ${response.statusMessage}");
      }
      return response;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) {
        logger.e("CONNECTION TIMEOUT");
        return;
      }
      if (e.type == DioExceptionType.receiveTimeout) {
        logger.e("RECEIVE TIMEOUT");
      }
      if (e.type == DioExceptionType.sendTimeout) {
        logger.e("SEND TIMEOUT");
      }
      if (e.type == DioExceptionType.unknown) {
        logger.e("unknown ERROR: ${e.message}");
        return Future.value(null);
      } else {
        logger.e("DIO : : ${e.response?.data}");
        throw e.response?.data['message'];
      }
    }
  }

  //delete Request
  static Future<dynamic> deleteRequest({required endpoint, id}) async {
    try {
      logger.d("--------------------");
      logger.d("REQUEST TYPE : delete ");
      logger.d("REQUEST END POINT : $endpoint/$id");

      Response response =
          await _dio.delete(endpoint + "/" + id.toString());
      if (response.statusCode == 400) {
        logger.e("DIO : 400 : Bad Request");
      } else if (response.statusCode == 401) {
        logger.e("DIO : 401 : Unauthorized");
      } else if (response.statusCode == 403) {
        logger.e("DIO : 403 : Forbidden");
      } else if (response.statusCode == 404) {
        logger.e("DIO : 404 : Not Found");
      } else if (response.statusCode == 422) {
        logger.e("DIO : 403 : Forbidden");
      } else {
        logger.e("DIO : ${response.statusCode} : ${response.statusMessage}");
      }
      return response;
    } on Exception catch (err) {
      logger.d(err.toString());
      return null;
    }
  }

  static Future<String?> refreshToken() async {
    // String refreshToken = await SharedPref.getRefreshToken() ?? '';
    // String accessToken = await SharedPref.getAccessToken() ?? '';
    // Map<String, dynamic> headers = {};
    // headers['authorization'] =
    //     accessToken.isNotEmpty ? 'Bearer $accessToken' : '';
    // headers['appId'] = appId;
    // try {
    //   // Response response =
    //   //     await Dio().post(ApiEndPoints.baseUrl + ApiEndPoints.refresh,
    //   //         data: RefreshTokenRequest(
    //   //           refreshToken: refreshToken,
    //   //         ),
    //   //         options: Options(
    //   //           headers: headers,
    //   //         ));
    //   // if (response.statusCode == 201) {
    //   //   logger.d("response: ${response.data}");
    //   //   // var user = loginUserModelFromJson(jsonEncode(response.data));
    //   //   // SharedPref.setTokens(user.accessToken!, user.refreshToken!);
    //   //   // await ApiClient.init();
    //     return null;
    //   } else {
    //     logger.e(
    //       "Error Updating Token",
    //     );
    //     return response.data["message"];
    //   }
    // } catch (e) {
    //   return e.toString();
    // }
    return null;
  }

  static void resolveFailedCall(DioException e, ErrorInterceptorHandler handler) {
    handler.reject(
      DioException(
        requestOptions: e.requestOptions,
        error: Strings.somethingWentWrong,
        response: Response(requestOptions: e.requestOptions, data: {
          "message": Strings.somethingWentWrong,
        }),
      ),
    );
  }
}
