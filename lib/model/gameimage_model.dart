// To parse this JSON data, do
//
//     final gameImageModel = gameImageModelFromJson(jsonString);

import 'dart:convert';

GameImageModel gameImageModelFromJson(String str) =>
    GameImageModel.fromJson(json.decode(str));

String gameImageModelToJson(GameImageModel data) => json.encode(data.toJson());

class GameImageModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  GameImageModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory GameImageModel.fromJson(Map<String, dynamic> json) => GameImageModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  String welcomeimage;
  String gameimage;
  String couponwonimage;

  Datum({
    required this.welcomeimage,
    required this.gameimage,
    required this.couponwonimage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        welcomeimage: json["welcomeimage"],
        gameimage: json["gameimage"] ?? '',
        couponwonimage: json["couponwonimage"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "welcomeimage": welcomeimage,
        "gameimage": gameimage,
        "couponwonimage": couponwonimage,
      };
}
