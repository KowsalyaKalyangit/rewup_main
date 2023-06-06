import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:rewup/controller/report_coupon_details_controller.dart';

import '../../utils/textstyles.dart';

class ReportCouponPage extends StatefulWidget {
  const ReportCouponPage({super.key});

  @override
  State<ReportCouponPage> createState() => _ReportCouponPageState();
}

class _ReportCouponPageState extends State<ReportCouponPage> {
  ReportCouponDetailsController reportCouponDetailsController =
      Get.put(ReportCouponDetailsController());

  getfunc() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    await reportCouponDetailsController.getReportCouponDetailsController();
  }

  @override
  void initState() {
    getfunc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (reportCouponDetailsController.reportcouponLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (reportCouponDetailsController.listData.isEmpty) {
        return Center(
          child: Text('NO DATA FOUND'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
          child: Container(
              height: 150.0.h,
              width: 1000.0.w,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        'Coupon Report',
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
                            itemCount: reportCouponDetailsController
                                .listData[0].data.length,
                            itemBuilder: (context, index) {
                              var couponname = reportCouponDetailsController
                                  .listData[0].data[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  //  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   couponname.title.toString(),
                                    //   style: categorytext,
                                    // ),
                                    // Text(
                                    //   couponname.totalcouponwon.toString(),
                                    //   style: categorytext,
                                    // ),
                                    // Text(
                                    //   couponname.totalcouponutilized.toString(),
                                    //   style: categorytext,
                                    // ),
                                    // Text(
                                    //   couponname.totalcouponunutilized
                                    //       .toString(),
                                    //   style: categorytext,
                                    // ),
                                    Container(
                                        width: 100.0.w,
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
                                        width: 65.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.totalcouponwon
                                                    .toString(),
                                                style: listtitlecolor,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        width: 65.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.totalcouponutilized
                                                    .toString(),
                                                style: listtitlecolor,
                                              ),
                                            )
                                          ],
                                        )),
                                    Container(
                                        width: 65.0.w,
                                        child: Row(
                                          children: <Widget>[
                                            Flexible(
                                              child: new Text(
                                                couponname.totalcouponunutilized
                                                    .toString(),
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
