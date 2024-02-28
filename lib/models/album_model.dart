// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

AlbumModel welcomeFromJson(String str) => AlbumModel.fromJson(json.decode(str));

String welcomeToJson(AlbumModel data) => json.encode(data.toJson());

class AlbumModel {
  final int userId;
  final int id;
  final String title;

  AlbumModel({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory AlbumModel.fromJson(Map<String, dynamic> json) => AlbumModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
