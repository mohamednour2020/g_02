import 'dart:convert';
import 'dart:developer';

import 'package:g_02/core/app_APIs/app_apis.dart';
import 'package:g_02/domain/models/popular_people_model.dart';
import 'package:http/http.dart' as http;

class PopularPeopleRequest {
  static Map<String, String>? headers = {"accept": "json"};

  static Future<PopularPeopleModel?> getPopularPeople() async {
    var respone = await http.get(
      Uri.parse(AppApis.getPopularAPI),
      headers: headers,
    );
    if (respone.statusCode == 200) {
      print(PopularPeopleModel.fromJson(jsonDecode(respone.body)).results?.length);

      return PopularPeopleModel.fromJson(jsonDecode(respone.body));
    } else {
      log(respone.statusCode.toString(), name: "your status code is :");
    }
    return null;
  }
}
