import 'package:get/get.dart';

import 'package:rewup/model/coupon_won_model.dart';
import 'package:rewup/model/report_coupon_details_model.dart';
import 'package:rewup/service/report_coupon_details_service.dart';

import '../service/coupon_won_service.dart';

class ReportCouponDetailsController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ReportCouponModel>[];
  List<ReportCouponModel> get listData => _listData;
  RxBool reportcouponLoading = true.obs;
  Map map = {};
  Future getReportCouponDetailsController() async {
    reportcouponLoading(true);
    try {
      var data = await ReportCouponService().getReportCouponService(
        dashboard: "coupondata",
      );
      if (data != null) {
        _listData.clear();
        _listData.add(data);

        reportcouponLoading(false);
      } else {
        reportcouponLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
