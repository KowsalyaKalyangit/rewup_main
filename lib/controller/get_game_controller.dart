import 'dart:math';

import 'package:get/get.dart';

import 'package:rewup/model/getgame_details_model.dart';

import 'package:rewup/service/getgame_service.dart';

class GameController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <GameDetailsModel>[];
  List<GameDetailsModel> get listData => _listData;
  RxBool isgameLoading = true.obs;
  Map map = {};
  var index = 0;
  List<String> imageUrls = [];
  Future getGameController(storeid) async {
    isgameLoading(true);
    try {
      _listData.clear();
      var data = await GameService()
          .getGameService(dashboard: "getgamedetails", storeid: storeid);
      if (data != null) {
        _listData.add(data);

        // for (var item in _listData) {
        //   imageUrls.add(item.data[index].gameimage);
        // }

        update();
        print('++++++++++++++++');
        print(imageUrls);
        isgameLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
