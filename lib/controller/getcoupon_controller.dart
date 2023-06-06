import 'package:get/get.dart';
import 'package:rewup/model/coupon_details.dart';
import 'package:rewup/service/getcoupon_service.dart';

class CouponController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CouponDetails>[];
  List<CouponDetails> get listData => _listData;
  RxBool isCouponLoading = true.obs;
  Map map = {};
  Future getCouponController(storeid) async {
    isCouponLoading(true);
    try {
      _listData.clear();
      var data = await CouponService()
          .getCouponData(dashboard: "getcoupondetails", storeid: storeid);
      if (data != null) {
        _listData.add(data);

        isCouponLoading(false);
      } else {}
    } catch (e) {
      rethrow;
    }
  }
}
