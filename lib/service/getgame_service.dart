import 'dart:convert';
import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import '../model/getgame_details_model.dart';
import '../utils/constants.dart';

class GameService {
  Future<GameDetailsModel?> getGameService({dashboard, storeid}) async {
    var body = {"dashboard": dashboard ?? "", "storeid": storeid};
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
        return GameDetailsModel.fromJson(data);
      } else {
        Fluttertoast.showToast(msg: data["message"]);
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }
}
