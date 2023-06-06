// To parse this JSON data, do
//
//     final customerDetailsModel = customerDetailsModelFromJson(jsonString);

import 'dart:convert';

CustomerDetailsModel customerDetailsModelFromJson(String str) =>
    CustomerDetailsModel.fromJson(json.decode(str));

String customerDetailsModelToJson(CustomerDetailsModel data) =>
    json.encode(data.toJson());

class CustomerDetailsModel {
  int success;
  String status;
  String message;
  int totalCustomers;
  List<Datum> data;

  CustomerDetailsModel({
    required this.success,
    required this.status,
    required this.message,
    required this.totalCustomers,
    required this.data,
  });

  factory CustomerDetailsModel.fromJson(Map<String, dynamic> json) =>
      CustomerDetailsModel(
        success: json["success"],
        status: json["status"],
        message: json["message"],
        totalCustomers: json["TotalCustomers"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "message": message,
        "TotalCustomers": totalCustomers,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  String name;
  String email;
  String? phone;
  int storeId;
  String store;

  Datum({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.storeId,
    required this.store,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        storeId: json["store_id"],
        store: json["store"]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "store_id": storeId,
        "store": storeValues.reverse[store],
      };
}

enum Store { TIBET_MOMO }

final storeValues = EnumValues({"Tibet Momo": Store.TIBET_MOMO});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
