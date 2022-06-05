import 'package:dvnapp/model/BooksModel.dart';
import 'package:flutter/material.dart';

class AppStateNotifier extends ChangeNotifier {
  //
  bool isDarkMode = false;
  String _username = "Amaan Attari";
  dynamic _weekly_risala = [];
  List<BooksModel> _books = [];

  String get username => _username;
  dynamic get weekly_risala => _weekly_risala;
  List<BooksModel> get books => _books;

  set updateTheme(bool isDarkMode_) {
    isDarkMode = isDarkMode_;
    notifyListeners();
  }

  set changeUsername(String val) {
    _username = val;
    notifyListeners();
  }

  set weeklyRisala(dynamic data) {
    _weekly_risala = data;
    notifyListeners();
  }

  set books(List<BooksModel> data) {
    _books = data;
    notifyListeners();
  }
}
