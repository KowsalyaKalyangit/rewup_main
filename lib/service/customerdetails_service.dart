import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/chatsurvey_customerdetails_model.dart';

import '../model/customer_details_model.dart';
import '../utils/constants.dart';

class CustomerDetailsService {
  Future<CustomerDetailsModel?> getCustomerDetailsService() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    var body = {
      "dashboard": "getcustomerdata",
      "storeid": storeid ?? '',
    };
    var bodyencode = json.encode(body);

    log(body.toString());
    try {
      var response = await http.post(
        Uri.parse("http://demo.cherritech.us/api/getDetails.php"),
        body: bodyencode,
        headers: {'Authorization': 'Bearer ${Constants.token}'},
      );

      log(response.body.toString());
      var data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return CustomerDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
