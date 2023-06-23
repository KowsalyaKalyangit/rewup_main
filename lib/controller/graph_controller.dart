import 'dart:math';

import 'package:get/get.dart';

import 'package:rewup/model/graph_model.dart';

import '../service/bar_graph_service.dart';

class GraphController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;

  var _listData = <GraphModel>[];
  var item = [];
  List<GraphModel> get listData => _listData;
  RxBool isgraphLoading = true.obs;
  Map map = {};
  Future getGraphController(storeid,) async {
    isgraphLoading(true);
    try {
      _listData.clear();
      var data = await BarGraphService()
          .getBarGraphService(dashboard: "customerdata", storeid: storeid);
      if (data != null) {
        _listData.add(data);

        isgraphLoading(false);
      } else {
        isgraphLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
