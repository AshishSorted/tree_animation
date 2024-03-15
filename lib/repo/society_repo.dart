import 'dart:convert';

import 'package:dio/dio.dart';

import '../network/api_client.dart';
import '../network/api_end_points.dart';
import '../network/service_exception.dart';
import '../screen/main_screen/model/society.dart';
import '../utils/logger.dart';

class SocietyRepo {
  static Future<SocietyModelResponse?> getSocietyList() async {
    try {
      Response response =
      await ApiClient.getRequest(endpoint: ApiEndPoints.societyList);
      if (response.statusCode == 200) {
        logger.d("Response : ${response.data}");
        var json = jsonEncode(response.data);
        return societyModelFromJson(json);
      } else {
        logger.d("Response is null : ${response.data}");
        return null;
      }
    } on ServiceException catch (e) {
      throw RepoServiceException(message: e.message);
    }
  }
}
