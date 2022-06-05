// To parse this JSON data, do
//
//     final moduleModel = moduleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ModuleModel> moduleModelFromJson(String str) => List<ModuleModel>.from(
    json.decode(str).map((x) => ModuleModel.fromJson(x)));

String moduleModelToJson(List<ModuleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ModuleModel {
  ModuleModel({
    @required this.id,
    @required this.title,
    @required this.webIcon,
    @required this.appIcon,
    @required this.webRoute,
    @required this.appRoute,
    @required this.hexColorCode,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int? id;
  String? title;
  dynamic webIcon;
  String? appIcon;
  dynamic webRoute;
  String? appRoute;
  String? hexColorCode;
  dynamic createdAt;
  dynamic updatedAt;

  factory ModuleModel.fromJson(Map<String, dynamic> json) => ModuleModel(
        id: json["id"],
        title: json["title"],
        webIcon: json["web_icon"],
        appIcon: json["app_icon"],
        webRoute: json["web_route"],
        appRoute: json["app_route"],
        hexColorCode: json["hex_color_code"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "web_icon": webIcon,
        "app_icon": appIcon,
        "web_route": webRoute,
        "app_route": appRoute,
        "hex_color_code": hexColorCode,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
