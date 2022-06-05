import 'dart:convert';
import 'package:dvnapp/model/ModuleModel.dart';
import 'package:http/http.dart';

import 'environment.dart';

class HttpService {
  final String apiHost = Environment().config!.apiHost;

  // String? baseURL = "http://amaanattari.ddns.net:8000/media-api/api";

  //String? endpoint;

  // HttpService() {
  //   //endpoint = endpoint_;
  // }

  Future<List<ModuleModel>> getPosts(endpoint) async {
    final url = Uri.parse('$apiHost$endpoint');
    Response res = await get(url);

    if (res.statusCode == 200) {
      // print(jsonDecode(res.body)['data']);
      List<dynamic> body = jsonDecode(res.body)['data'];

      List<ModuleModel> modules = body
          .map(
            (dynamic item) => ModuleModel.fromJson(item),
          )
          .toList();

      return modules;
    } else {
      throw "Unable to retrieve posts.";
    }
  }

  Future<Map<String, dynamic>> getModules(endpoint) async {
    final url = Uri.parse('$apiHost$endpoint');
    Response res = await get(url);

    if (res.statusCode == 200) {
      //print("Downloaded");
      //print(jsonDecode(res.body)['data']);
      // print(jsonDecode(res.body)['data']);
      // List<dynamic> body = jsonDecode(res.body)['data'];

      // final modules = body
      //     .map(
      //       (dynamic item) => item,
      //     )
      //     .toList();

      return jsonDecode(res.body);
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
