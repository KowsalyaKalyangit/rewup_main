// To parse this JSON data, do
//
//     final pieChartModel = pieChartModelFromJson(jsonString);

import 'dart:convert';

PieChartModel pieChartModelFromJson(String str) => PieChartModel.fromJson(json.decode(str));

String pieChartModelToJson(PieChartModel data) => json.encode(data.toJson());

class PieChartModel {
    int success;
    String status;
    String message;
    int totalCoupon;
    int totalCouponwon;
    dynamic totalCouponutilized;
    int totalCouponunutilized;

    PieChartModel({
        required this.success,
        required this.status,
        required this.message,
        required this.totalCoupon,
        required this.totalCouponwon,
        this.totalCouponutilized,
        required this.totalCouponunutilized,
    });

    factory PieChartModel.fromJson(Map<String, dynamic> json) => PieChartModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCoupon: json["TotalCoupon"],
        totalCouponwon: json["TotalCouponwon"],
        totalCouponutilized: json["TotalCouponutilized"],
        totalCouponunutilized: json["TotalCouponunutilized"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCoupon": totalCoupon,
        "TotalCouponwon": totalCouponwon,
        "TotalCouponutilized": totalCouponutilized,
        "TotalCouponunutilized": totalCouponunutilized,
    };
}
