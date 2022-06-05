// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// List<BooksModel> booksModelFromJson(String str) =>
//     List<BooksModel>.from(json.decode(str).map((x) => BooksModel.fromJson(x)));

// String booksModelToJson(List<BooksModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BooksModel {
  BooksModel({
    @required this.id,
    @required this.mid,
    @required this.userId,
    @required this.title,
    @required this.description,
    @required this.ext,
    @required this.type,
    @required this.size,
    @required this.fileName,
    @required this.path,
    @required this.duration,
    @required this.createdAt,
    @required this.updatedAt,
  });

  int? id;
  dynamic mid;
  dynamic userId;
  String? title;
  dynamic description;
  String? ext;
  String? type;
  dynamic size;
  dynamic fileName;
  String? path;
  dynamic duration;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
        id: json["id"],
        mid: json["mid"],
        userId: json["user_id"],
        title: json["title"],
        description: json["description"],
        ext: json["ext"],
        type: json["type"],
        size: json["size"],
        fileName: json["file_name"],
        path: json["path"],
        duration: json["duration"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mid": mid,
        "user_id": userId,
        "title": title,
        "description": description,
        "ext": ext,
        "type": type,
        "size": size,
        "file_name": fileName,
        "path": path,
        "duration": duration,
        "created_at": createdAt.toString(),
        "updated_at": updatedAt.toString(),
      };
}
