import 'package:rewup/controller/pie_chart_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';

import '../controller/coupon_won_controller.dart';
import '../controller/getdetails_controller.dart';

import '../controller/graph_controller.dart';
import '../controller/report_coupon_details_controller.dart';
import '../utils/constants.dart';
import 'dashboard/coupon_won_readmore.dart';
import 'dashboard/couponwon_page.dart';
import 'dashboard/pie_chart.dart';
import 'dashboard/report_coupon_page.dart';
import 'dashboard/store_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DetailsController detailsController = Get.put(DetailsController());
  CouponWonController couponWonController = Get.put(CouponWonController());
  ReportCouponDetailsController reportCouponDetailsController =
      Get.put(ReportCouponDetailsController());

  getfunc() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    await couponWonController.getCouponwonController();
    await reportCouponDetailsController.getReportCouponDetailsController();
  }

  // GraphController graphController = Get.put(GraphController());
  // PieChartcontroller chartcontroller=Pie

  @override
  void initState() {
    // detailsController.getDetailController();
    getfunc();
    super.initState();
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  var winnersname = [
    'kalyan',
    'N/A',
    'Penda',
    'Moham',
    'N/A',
    'Sandra',
    'Muriel',
    'Jode'
  ];

  var dishname = [
    '1 Tandoori',
    'Pizza',
    'Burger',
    'dosa',
    'Briyani',
    'Mini Idly',
    'Gobi 65',
    'Chicken 65'
  ];
  getappbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: appbarcolor,
      automaticallyImplyLeading: false,
      leadingWidth: 300.0.w,
      toolbarHeight: 80.0.h,
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Marina',
              style: toptitleappcolor,
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Text(
              'Today you had 7 participants',
              style: appbarstyle,
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectDate(context);
              });
            },
            child: Icon(
              Icons.calendar_month_outlined,
              color: screenbackground,
            ),
          ),
        ),
        // Padding(
        //   padding: const EdgeInsets.only(right: 20.0),
        //   child: InkWell(
        //     onTap: () {
        //       Get.to(StoreDetailsPage());
        //     },
        //     child: Icon(
        //       Icons.person_3_outlined,
        //       color: screenbackground,
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getappbar(),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Card(
              //   child: ListTile(
              //     title: Text(
              //       'Welcome',
              //       style: toptitleappcolor,
              //     ),
              //     trailing: SizedBox(
              //       width: 50.0.w,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               setState(() {
              //                 _selectDate(context);
              //               });
              //             },
              //             child: Icon(
              //               Icons.calendar_month_outlined,
              //               color: toptitlecolor,
              //             ),
              //           ),
              //           Icon(
              //             Icons.person_3_outlined,
              //             color: toptitlecolor,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Categories(),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon won ',
                      style: listtitle,
                    ),
                    InkWell(
                      onTap: () {
                        // Get.toNamed('/couponwon');
                        Get.to(CouponwonPage(
                            name: couponWonController
                                .listData[0].title[0].title1
                                .toString(),
                            coupon: couponWonController
                                .listData[0].title[0].title2
                                .toString(),
                            date: couponWonController
                                .listData[0].title[0].title3
                                .toString()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                          width: 80.0.w,
                          height: 30.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            //color: Colors.amber[900],
                          ),
                          child: Center(
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Readmore',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Icon(
                                  Icons.double_arrow,
                                  color: formhintcolor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
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
                    padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                    child: Container(
                        height: 30.0.h,
                        width: 500.0.w,
                        decoration: BoxDecoration(
                            color: appbarcolor,
                            borderRadius: BorderRadius.circular(5)),
                        child: ListView.builder(
                            itemCount:
                                couponWonController.listData[0].title.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  // mainAxisAlignment:
                                  //     MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 120.0.w,
                                      child: Text(
                                        couponWonController
                                            .listData[0].title[index].title1
                                            .toString(),
                                        style: viewdetails,
                                      ),
                                    ),
                                    Container(
                                      width: 120.0.w,
                                      child: Text(
                                        couponWonController
                                            .listData[0].title[index].title2
                                            .toString(),
                                        style: viewdetails,
                                      ),
                                    ),
                                    Container(
                                      // width: 120.0.w,
                                      child: Text(
                                        couponWonController
                                            .listData[0].title[index].title3
                                            .toString(),
                                        style: viewdetails,
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
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                        height: 150.0.h,
                        width: 1000.0.w,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      var couponname = couponWonController
                                          .listData[0].data[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 20.0, right: 8.0),
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
                                                        couponname.name
                                                            .toString(),
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
                                                        couponname.title
                                                            .toString(),
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
                                                        couponname.timeAdded
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
                              )
                            ],
                          ),
                        )),
                  );
                }
              }),

              SizedBox(
                height: 10.0.h,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Chart ',
                      style: listtitle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 180.0.h,
                  width: 800.0.w,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child:
                              Container(height: 150.h, child: PieChartPage()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Coupon Report ',
                      style: listtitle,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(ReportCouponPage(
                            coupon: reportCouponDetailsController
                                .listData[0].title[0].title1
                                .toString(),
                            totalwon: reportCouponDetailsController
                                .listData[0].title[0].title2
                                .toString(),
                            utilized: reportCouponDetailsController
                                .listData[0].title[0].title3
                                .toString(),
                            unutilized: reportCouponDetailsController
                                .listData[0].title[0].title4
                                .toString()));
                        // Get.toNamed('/couponreport');
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Container(
                          width: 80.0.w,
                          height: 30.0.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            // color: appbarcolor,
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Readmore',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          fontSize: 10.00.sp,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500)),
                                ),
                                Icon(
                                  Icons.double_arrow,
                                  color: formhintcolor,
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Obx(() {
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
                    padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                    child: Container(
                        height: 30.0.h,
                        width: 500.0.w,
                        decoration: BoxDecoration(
                            color: appbarcolor,
                            borderRadius: BorderRadius.circular(5)),
                        child: ListView.builder(
                            itemCount:
                                reportCouponDetailsController.listData.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // width: 120.0.w,
                                      child: Text(
                                        reportCouponDetailsController
                                            .listData[0].title[0].title1
                                            .toString(),
                                        style: viewdetails,
                                      ),
                                    ),
                                    Container(
                                      // width: 120.0.w,
                                      child: Text(
                                        reportCouponDetailsController
                                            .listData[0].title[index].title2
                                            .toString(),
                                        style: viewdetails,
                                      ),
                                    ),
                                    Container(
                                      // width: 120.0.w,
                                      child: Text(
                                        reportCouponDetailsController
                                            .listData[0].title[index].title3
                                            .toString(),
                                        style: viewdetails,
                                      ),
                                    ),
                                    Container(
                                      // width: 120.0.w,
                                      child: Text(
                                        reportCouponDetailsController
                                            .listData[0].title[index].title4
                                            .toString(),
                                        style: viewdetails,
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
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                        height: 150.0.h,
                        width: 1000.0.w,
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.0.h,
                              ),
                              Container(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                      var couponname =
                                          reportCouponDetailsController
                                              .listData[0].data[index];
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                                width: 100.0.w,
                                                child: Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: new Text(
                                                        couponname.title
                                                            .toString(),
                                                        style: listtitlecolor,
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                                width: 70.0.w,
                                                child: Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: new Text(
                                                        couponname
                                                            .totalcouponwon
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
                                                        couponname
                                                            .totalcouponutilized
                                                            .toString(),
                                                        style: listtitlecolor,
                                                      ),
                                                    )
                                                  ],
                                                )),
                                            Container(
                                                width: 30.0.w,
                                                child: Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: new Text(
                                                        couponname
                                                            .totalcouponunutilized
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
                              )
                            ],
                          ),
                        )),
                  );
                }
              })
            ]),
      ),
    );
  }
}
