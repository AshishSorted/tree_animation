// ignore: library_prefixes
import 'package:dio/dio.dart' as DioApi;
import 'package:tree_animation/network/api_client.dart';
import 'package:tree_animation/network/api_end_points.dart';
import 'package:tree_animation/screen/app_config/model/config_request_model.dart';
import 'package:tree_animation/screen/app_config/model/config_response_model.dart';
import 'package:tree_animation/utils/logger.dart';


class AppConfigRepo {
  static Future<List<ConfigResponseModel>?> getConfig() async {
    try {
      DioApi.Response response =
          await ApiClient.getRequest(endpoint: ApiEndPoints.appConfig);
      if (response.statusCode == 200) {
        logger.d("Not null response  ");
        return ((response.data ?? []) as List)
            .map((e) => ConfigResponseModel.fromMap(e))
            .toList();
      } else {
        logger.d("Null response ");
        return [];
      }
    } catch (e) {
      logger.e("ConfigRepo : : $e");
      return null;
    }
  }

  static Future<String?> postConfig(AppConfigRequest appConfigRequest) async {
    try {
      DioApi.Response response = await ApiClient.postRequest(
        endpoint: ApiEndPoints.appConfig,
        param: appConfigRequest.toMap(),
      );
      if (response.statusCode == 201) {
        logger.d("Not null response  ");
        return null;
      } else {
        logger.d("Null response ");
        return response.data['message'];
      }
    } catch (e) {
      logger.e("ConfigRepo : : $e");
      return e.toString();
    }
  }
}
