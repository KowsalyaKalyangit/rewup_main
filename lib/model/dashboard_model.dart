// To parse this JSON data, do
//
//     final dashboardModel = dashboardModelFromJson(jsonString);

import 'dart:convert';

DashboardModel dashboardModelFromJson(String str) =>
    DashboardModel.fromJson(json.decode(str));

String dashboardModelToJson(DashboardModel data) => json.encode(data.toJson());

class DashboardModel {
  int success;
  String status;
  String message;
  List<Datum> data;

  DashboardModel({
    required this.success,
    required this.status,
    required this.message,
    required this.data,
  });

  factory DashboardModel.fromJson(Map<String, dynamic> json) => DashboardModel(
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
  String name;
  int total;
  int? totalUtilized;
  String? couponPercentage;

  Datum({
    required this.name,
    required this.total,
    this.totalUtilized,
    this.couponPercentage,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        total: json["Total"],
        totalUtilized: json["TotalUtilized"],
        couponPercentage: json["CouponPercentage"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "Total": total,
        "TotalUtilized": totalUtilized,
        "CouponPercentage": couponPercentage,
      };
}
