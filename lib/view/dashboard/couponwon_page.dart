import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_won_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';

class CouponwonPage extends StatefulWidget {
  const CouponwonPage({
    super.key,
  });

  @override
  State<CouponwonPage> createState() => _CouponwonPageState();
}

class _CouponwonPageState extends State<CouponwonPage> {
  CouponWonController couponWonController = Get.put(CouponWonController());

  // getfunc() async {
  //   // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //   // var storeid = sharedPreferences.getString(Constants.storeid);
  //   await couponWonController.getCouponwonController();
  // }

  // @override
  // void initState() {
  //   setState(() {
  //     getfunc();
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   couponWonController.dispose();
  //   super.dispose();
  // }

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
        return Scaffold(
          appBar: AppBar(
              elevation: 0,
              backgroundColor: appbarcolor,
              //  / automaticallyImplyLeading: false,
              centerTitle: true,
              leading: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(Icons.arrow_back))),
              title: Text(
                'Coupon Won',
                style: heading,
              )),
          body: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
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
                        padding: const EdgeInsets.only(left: 00.0, right: 00.0),
                        child: Container(
                            height: 30.0.h,
                            width: 500.0.w,
                            decoration: BoxDecoration(
                                color: Color(0xff423592).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(5)),
                            child: ListView.builder(
                                itemCount: couponWonController
                                    .listData[0].title.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          width: 130.0.w,
                                          child: Text(
                                            couponWonController
                                                .listData[0].title[index].title1
                                                .toString(),
                                            style: tablestyle,
                                          ),
                                        ),
                                        Container(
                                          width: 120.0.w,
                                          child: Text(
                                            couponWonController
                                                .listData[0].title[index].title2
                                                .toString(),
                                            style: tablestyle,
                                          ),
                                        ),
                                        Container(
                                          // width: 120.0.w,
                                          child: Text(
                                            couponWonController
                                                .listData[0].title[index].title3
                                                .toString(),
                                            style: tablestyle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                })),
                      );
                    }
                  }),
                  Obx(() {
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
                        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                        child: Container(
                            height: 1000.0.h,
                            width: 1000.0.w,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: couponWonController
                                            .listData[0].data.length,
                                        itemBuilder: (context, index) {
                                          var couponname = couponWonController
                                              .listData[0].data[index];
                                          return Container(
                                            height: 40.0.h,
                                            width: 500.w,
                                            child: Card(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,

                                                //  crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                      width: 80.0.w,
                                                      child: Row(
                                                        children: <Widget>[
                                                          Flexible(
                                                            child: new Text(
                                                              couponname.name
                                                                  .toString(),
                                                              style:
                                                                  listtitlecolor,
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
                                                              couponname.title
                                                                  .toString(),
                                                              style:
                                                                  listtitlecolor,
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
                                                              couponname
                                                                  .timeAdded
                                                                  .toString(),
                                                              style:
                                                                  listtitlecolor,
                                                            ),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            )),
                      );
                    }
                  }),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
