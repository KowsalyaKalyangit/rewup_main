// To parse this JSON data, do
//
//     final couponWonModel = couponWonModelFromJson(jsonString);

import 'dart:convert';

CouponWonModel couponWonModelFromJson(String str) => CouponWonModel.fromJson(json.decode(str));

String couponWonModelToJson(CouponWonModel data) => json.encode(data.toJson());

class CouponWonModel {
    int success;
    String status;
    String message;
    int totalcount;
    String storeId;
    String storename;
    List<Datum> data;

    CouponWonModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalcount,
        required this.storeId,
        required this.storename,
        required this.data,
    });

    factory CouponWonModel.fromJson(Map<String, dynamic> json) => CouponWonModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalcount: json["totalcount"],
        storeId: json["store_id"],
        storename: json["storename"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "totalcount": totalcount,
        "store_id": storeId,
        "storename": storename,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    int customerId;
    String name;
    
    String timeAdded;
    int couponId;
    String title;

    Datum({
        required this.id,
        required this.customerId,
        required this.name,
        required this.timeAdded,
        required this.couponId,
        required this.title,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        customerId: json["customer_id"],
        name: json["name"],
        timeAdded: json["time_added"],
        couponId: json["coupon_id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_id": customerId,
        "name": name,
        "time_added": timeAdded ,
        "coupon_id": couponId,
        "title": titleValues.reverse[title],
    };
}

enum Title { THE_10_OFF, THE_30_OFF, THE_20_OFF, THE_15_OFF }

final titleValues = EnumValues({
    "10% OFF": Title.THE_10_OFF,
    "15% OFF": Title.THE_15_OFF,
    "20% OFF": Title.THE_20_OFF,
    "30% OFF": Title.THE_30_OFF
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
