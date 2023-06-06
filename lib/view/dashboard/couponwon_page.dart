import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_won_controller.dart';

import '../../utils/textstyles.dart';

class CouponwonPage extends StatefulWidget {
  const CouponwonPage({super.key});

  @override
  State<CouponwonPage> createState() => _CouponwonPageState();
}

class _CouponwonPageState extends State<CouponwonPage> {
  CouponWonController couponWonController = Get.put(CouponWonController());

  getfunc() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    await couponWonController.getCouponwonController();
  }

  @override
  void initState() {
    getfunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (couponWonController.couponLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (couponWonController.listData.isEmpty) {
        return Center(
          child: Text('NO DATA FOUND'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
              height: 200.0.h,
              width: 1000.0.w,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Coupon won ',
                        style: listtitle,
                      ),
                    ),
                    SizedBox(
                      height: 10.0.h,
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                couponWonController.listData[0].data.length,
                            itemBuilder: (context, index) {
                              var couponname =
                                  couponWonController.listData[0].data[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  //  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width: 80.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.name.toString(),
                                                style: listtitlecolor,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        width: 50.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.title.toString(),
                                                style: listtitlecolor,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        width: 100.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.timeAdded.toString(),
                                                style: listtitlecolor,
                                              ),
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )),
        );
      }
    });
  }
}
