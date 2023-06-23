import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/date/dashboard_count_controller.dart';
import 'package:rewup/view/dashboard/game_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/constants.dart';
import 'chatsurvey.dart';
import 'coupon_utilized_page.dart';
import 'coupondetails_page.dart';
import 'couponwon_page.dart';
import 'customer_details.dart';

class DashboardList extends StatefulWidget {
  const DashboardList({super.key});

  @override
  State<DashboardList> createState() => _DashboardListState();
}

class _DashboardListState extends State<DashboardList> {
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  DashboardCountcontroller dashboardCountcontroller =
      Get.put(DashboardCountcontroller());

  @override
  void initState() {
    //  detailsController.getDetailController();
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    setState(() {
      dashboardcontroller.dahboardcontroller(storeid.toString());
      //   dashboardCountcontroller.dahboardCountcontroller(storeid, context);
    });
  }

  var color = [
    Color(0xFFEEE2B6),
    Color(0xffd7efff),
    Color(0xffe0d7ff),
    Color(0xfffbe1fb),
    Color(0xffb8eedc)
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dashboardcontroller.ischatsurveyLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (dashboardcontroller.listData.isEmpty) {
        return Center(
          child: Text('No Data Found'),
        );
      } else {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Container(
              height: 220.0.h,
              width: 1000.0.w,
              padding: EdgeInsets.all(5.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,

                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dashboardcontroller.listData[0].data.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 900 / 3,
                      childAspectRatio: 9 / 3.50,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 5),
                  itemBuilder: (BuildContext context, index) {
                    //var listdata = detailsController.listData[index];
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Get.to(CouponwonPage());
                        }

                        if (index == 1) {
                          Get.to(CustomerDetailsPage());
                        }

                        if (index == 2) {
                          Get.to(GameDetailsPage());
                        }
                        if (index == 3) {
                          Get.to(CoupontilizedPage());
                        }
                      },
                      child: Card(
                        color: color[index],
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //     height: 35.h,
                              //     child: Image.asset(images[index])),
                              Text(
                                dashboardcontroller
                                    .listData[0].data[index].name,
                                style: homepagecount,
                              ),
                              Text(
                                dashboardcontroller.fromdate.text == '' &&
                                        dashboardcontroller.todate.text == ''
                                    ? dashboardcontroller
                                        .listData[0].data[index].total
                                        .toString()
                                    : dashboardcontroller
                                        .listData[0].data[index].total
                                        .toString(),
                                style: homepagecountcolor,
                              ),
                            ]),
                      ),
                    );
                  })),
        );
      }
    });
  }
}
