import 'package:rewup/controller/getcoupon_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';

class CouponDetailsPage extends StatefulWidget {
  const CouponDetailsPage({super.key});

  @override
  State<CouponDetailsPage> createState() => _CouponDetailsPageState();
}

class _CouponDetailsPageState extends State<CouponDetailsPage> {
  CouponController couponController = Get.put(CouponController());
  @override
  void initState() {
    fun();
    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    couponController.getCouponController(storeid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (couponController.isCouponLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (couponController.listData.isEmpty) {
          return Center(child: Text('No Data Found'));
        } else {
          return Scaffold(
            backgroundColor: bgcolor,
            appBar: AppBar(
                elevation: 0,
                backgroundColor: appbarcolor,
                //  / automaticallyImplyLeading: false,
                //centerTitle: true,
                leading: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: screenbackground,
                      )),
                ),
                title: Text(
                  'Coupons',
                  style: heading,
                )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (couponController.isCouponLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (couponController.listData.isEmpty) {
                      return Center(
                        child: Text('NO DATA FOUND'),
                      );
                    } else {
                      return Container(
                          height: 30.0.h,
                          width: 500.0.w,
                          decoration: BoxDecoration(
                              color: Color(0xff423592).withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5)),
                          child: ListView.builder(
                              itemCount: couponController.listData.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: 50.0.w,
                                        child: Text(
                                          couponController
                                              .listData[0].title[0].title1
                                              .toString(),
                                          style: profiletext,
                                        ),
                                      ),
                                      Container(
                                        width: 50.0.w,
                                        child: Text(
                                          couponController
                                              .listData[0].title[index].title2
                                              .toString(),
                                          style: profiletext,
                                        ),
                                      ),
                                      Container(
                                        width: 60.0.w,
                                        child: Text(
                                          couponController
                                              .listData[0].title[index].title3
                                              .toString(),
                                          style: profiletext,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0.w,
                                      )
                                      // Container(
                                      //   // width: 120.0.w,
                                      //   child: Text(
                                      //     couponController
                                      //         .listData[0].title[index].title4
                                      //         .toString(),
                                      //     style: viewdetails,
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                );
                              }));
                    }
                  }),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                    child: Container(
                      height: 900.h,
                      width: 500.w,
                      child: ListView.builder(
                          itemCount: couponController.listData[0].data.length,
                          itemBuilder: (context, index) {
                            return Container(
                                height: 50.0.h,

                                //  margin: EdgeInsets.all(5),
                                child: InkWell(
                                  onTap: () {
                                    showDialog<void>(
                                        context: context,
                                        barrierDismissible:
                                            false, // user must tap button!
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Column(
                                              children: [
                                                Text(
                                                  'Coupon Code',
                                                  style: homepagecountcolor,
                                                ),
                                                SizedBox(
                                                  height: 15.h,
                                                ),
                                                Container(
                                                  height: 20.0.h,
                                                  width: 60.0.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Color(0xff423592)
                                                        .withOpacity(0.2),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      couponController
                                                          .listData[0]
                                                          .data[index]
                                                          .couponCode,
                                                      style: homepagecountcolor,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10.h,
                                                ),
                                                Image.network(
                                                  couponController.listData[0]
                                                      .data[index].image,
                                                  height: 100.h,
                                                )
                                              ],
                                            ),
                                            content: SingleChildScrollView(
                                              child: ListBody(
                                                children: <Widget>[],
                                              ),
                                            ),
                                            actions: <Widget>[
                                              CircleAvatar(
                                                backgroundColor: appbarcolor,
                                                radius: 20,
                                                child: TextButton(
                                                  child: Text(
                                                    'ok',
                                                    style: headingcolor,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  child: Card(
                                    //elevation: 0,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            couponController
                                                .listData[0].data[index].title,
                                            style: tablestyle),
                                        Text(
                                            couponController
                                                .listData[0].data[index].store,
                                            style: tablestyle),
                                        Text(
                                            couponController.listData[0]
                                                .data[index].category,
                                            style: tablestyle),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.grey,
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                          }),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
