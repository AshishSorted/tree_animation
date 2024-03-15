// ignore: library_prefixes
import 'package:dio/dio.dart' as DioApi;
import 'package:tree_animation/network/api_client.dart';
import 'package:tree_animation/network/api_end_points.dart';
import 'package:tree_animation/screen/app_config/model/config_response_model.dart';
import 'package:tree_animation/utils/logger.dart';


class InitRepo {
  static Future<ConfigResponseModel?> getInitConfig() async {
    try {
      DioApi.Response response =
          await ApiClient.getRequest(endpoint: ApiEndPoints.initConfig);
      if (response.statusCode == 200) {
        logger.d("not null response ");
      } else {
        logger.d("Null response");
      }
      return ConfigResponseModel.fromMap(response.data);
    } catch (e) {
      logger.e("InitRepo : : $e");
      return null;
    }
  }
}
