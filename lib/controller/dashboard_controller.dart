import 'package:get/get.dart';
import 'package:rewup/model/chatsuyrvey_model.dart';

import 'package:rewup/service/chatsurey_service.dart';
import 'package:rewup/service/dashboard_details_service.dart';

import '../model/dashboard_model.dart';

class Dashboardcontroller extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <DashboardModel>[];
  List<DashboardModel> get listData => _listData;
  RxBool ischatsurveyLoading = true.obs;
  Map map = {};
  Future dahboardcontroller(storeid) async {
    ischatsurveyLoading(true);
    try {
      _listData.clear();
      var data = await DashboardService().dashboardService(
          dashboard: "getdashboarddetails", storeid: storeid);
      if (data != null) {
        _listData.add(data);

        ischatsurveyLoading(false);
      } else {
        ischatsurveyLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
