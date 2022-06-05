import 'dart:async';
import 'dart:convert';
import 'package:dvnapp/model/BooksModel.dart';
import 'package:http/http.dart' as http;

import 'environment.dart';

class AppHttpClient {
  final String apiHost = Environment().config!.apiHost;
  // static Future getWeeklyRisala() {
  //   return http.get(Uri.parse(
  //       "http://amaanattari.ddns.net:8000/media-api/api/weekly_risala"));
  // }

  List<BooksModel> bookList = [];

  Future<List<BooksModel>> getBooks(context, String queryPrams) async {
    final response = await http.get(Uri.parse("$apiHost/books$queryPrams"));
    var data = jsonDecode(response.body)['data'];
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        bookList.add(BooksModel.fromJson(i));
      }
      print("bookList");
      print(bookList);
      return bookList;
    } else {
      return bookList;
    }
  }
}
