import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/coupon_won_model.dart';
import '../model/report_coupon_details_model.dart';
import '../utils/constants.dart';

class ReportCouponService {
  Future<ReportCouponModel?> getReportCouponService({dashboard}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    print('Enterrrrrr');
    var body = {
      "dashboard": dashboard ?? "",
      "storeid": storeid ?? '',
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://demo.cherritech.us/api/getReport.php"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return ReportCouponModel.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
