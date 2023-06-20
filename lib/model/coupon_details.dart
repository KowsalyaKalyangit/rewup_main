// To parse this JSON data, do
//
//     final couponDetails = couponDetailsFromJson(jsonString);

import 'dart:convert';

CouponDetails couponDetailsFromJson(String str) =>
    CouponDetails.fromJson(json.decode(str));

String couponDetailsToJson(CouponDetails data) => json.encode(data.toJson());

class CouponDetails {
  int success;
  String status;
  String message;
  List<Title> title;
  List<Datum> data;

  CouponDetails({
    required this.success,
    required this.status,
    required this.message,
    required this.title,
    required this.data,
  });

  factory CouponDetails.fromJson(Map<String, dynamic> json) => CouponDetails(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        title: List<Title>.from(json["title"].map((x) => Title.fromJson(x))),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "title": List<dynamic>.from(title.map((x) => x.toJson())),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String title;
  String couponCode;
  int status;
  String image;
  String store;
  String category;

  Datum({
    required this.id,
    required this.title,
    required this.couponCode,
    required this.status,
    required this.image,
    required this.store,
    required this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        couponCode: json["coupon_code"],
        status: json["status"],
        image: json["image"],
        store: json["store"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "coupon_code": couponCode,
        "status": status,
        "image": image,
        "store": store,
        "category": category,
      };
}

class Title {
  String title1;
  String title2;
  String title3;
  String title4;

  Title({
    required this.title1,
    required this.title2,
    required this.title3,
    required this.title4,
  });

  factory Title.fromJson(Map<String, dynamic> json) => Title(
        title1: json["title1"],
        title2: json["title2"],
        title3: json["title3"],
        title4: json["title4"],
      );

  Map<String, dynamic> toJson() => {
        "title1": title1,
        "title2": title2,
        "title3": title3,
        "title4": title4,
      };
}
