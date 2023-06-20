import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewup/controller/coupon_won_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';

class CouponwonPage extends StatefulWidget {
  const CouponwonPage({super.key, this.name, this.coupon, this.date});
  final String? name;
  final String? coupon;
  final String? date;

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
                  Container(
                    height: 40.0.h,
                    width: 1000.0.w,
                    decoration: BoxDecoration(
                        color: Color(0xff423592).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 115.0.w,
                                child: Text(
                                  widget.name!,
                                  style: tablestyle,
                                ),
                              ),
                              Container(
                                width: 110.0.w,
                                child: Text(
                                  widget.coupon!,
                                  style: tablestyle,
                                ),
                              ),
                              Text(
                                widget.date!,
                                style: tablestyle,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 1000.0.h,
                    width: 1000.0.w,
                    child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        itemCount: couponWonController.listData[0].data.length,
                        itemBuilder: (context, index) {
                          var couponname =
                              couponWonController.listData[0].data[index];
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Container(
                              height: 40.0.h,
                              width: 100.0.w,
                              child: Card(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,

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
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
