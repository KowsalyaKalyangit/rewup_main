// To parse this JSON data, do
//
//     final gameDetailsModel = gameDetailsModelFromJson(jsonString);

import 'dart:convert';

GameDetailsModel gameDetailsModelFromJson(String str) =>
    GameDetailsModel.fromJson(json.decode(str));

String gameDetailsModelToJson(GameDetailsModel data) =>
    json.encode(data.toJson());

class GameDetailsModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  GameDetailsModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) =>
      GameDetailsModel(
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
  int id;
  String gameId;
  int storeId;
  String couponId;
  String redirectUrl;
  String redirectDescription;
  int status;
  String qrcode;
  String store;
  String game;
  String coupon;
  String gameimg;

  Datum({
    required this.id,
    required this.gameId,
    required this.storeId,
    required this.couponId,
    required this.redirectUrl,
    required this.redirectDescription,
    required this.status,
    required this.qrcode,
    required this.store,
    required this.game,
    required this.coupon,
    required this.gameimg,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        gameId: json["game_id"],
        storeId: json["store_id"],
        couponId: json["coupon_id"],
        redirectUrl: json["redirect_url"],
        redirectDescription: json["redirect_description"],
        status: json["status"],
        qrcode: json["qrcode"],
        store: json["store"],
        game: json["game"],
        coupon: json["coupon"],
        gameimg: json["gameimg"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "game_id": gameId,
        "store_id": storeId,
        "coupon_id": couponId,
        "redirect_url": redirectUrl,
        "redirect_description": redirectDescription,
        "status": status,
        "qrcode": qrcode,
        "store": store,
        "game": game,
        "coupon": coupon,
        "gameimg": gameimg,
      };
}
