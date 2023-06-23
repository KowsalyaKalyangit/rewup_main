import 'package:intl/intl.dart';
import 'package:rewup/controller/login_controller.dart';
import 'package:rewup/controller/pie_chart_controller.dart';
import 'package:rewup/view/profile/profile_section.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allpackages.dart';

import '../controller/coupon_won_controller.dart';
import '../controller/dashboard_controller.dart';
import '../controller/date/dashboard_count_controller.dart';
import '../controller/getdetails_controller.dart';

import '../controller/graph_controller.dart';
import '../controller/profile_controller.dart';
import '../controller/report_coupon_details_controller.dart';
import '../utils/constants.dart';
import 'dashboard/appbar.dart';
import 'dashboard/coupon_won_readmore.dart';
import 'dashboard/couponwon_page.dart';
import 'dashboard/pie_chart.dart';
import 'dashboard/report_coupon_page.dart';
import 'dashboard/store_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, String? username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DetailsController detailsController = Get.put(DetailsController());
  CouponWonController couponWonController = Get.put(CouponWonController());
  ReportCouponDetailsController reportCouponDetailsController =
      Get.put(ReportCouponDetailsController());
  ProfileController profileController = Get.put(ProfileController());
  DashboardCountcontroller dashboardCountcontroller =
      Get.put(DashboardCountcontroller());
  var username;
  var userid;
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());

  double? _progress;
  double? _progress1;
  getfunc() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username = sharedPreferences.getString(Constants.username);
    userid = sharedPreferences.getString(Constants.userid);

    await couponWonController.getCouponwonController();
    await reportCouponDetailsController.getReportCouponDetailsController();

    var storeid = sharedPreferences.getString(Constants.storeid);
    dashboardcontroller.dahboardcontroller(storeid);

    //  profileController.getProfileController(userid: userid.toString());
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
      toolbarHeight: 90.0.h,
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/LOGO.png',
              height: 20.0.h,
              color: screenbackground,
            ),
            AppbarPage()
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => StatefulBuilder(builder: (context, setState) {
                  return AlertDialog(
                    title: Text(
                      "To choose  from and to date and get the records",
                      style: listStyleappcolor,
                    ),
                    //content: const Text("You have raised a Alert Dialog Box"),
                    actions: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'From Date*',
                                style: profiletext,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                color: Color(0xffD9D9D9).withOpacity(0.1),
                                height: 40.00.h, width: 150.00.w,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  controller: dashboardcontroller.fromdate,
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dashboardcontroller.fromdate.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },

                                  style: tablestyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            width: 1),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Select From date',
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: appbarcolor,
                                        size: 20,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintStyle: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500)),
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'To Date*',
                                style: profiletext,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                color: Color(0xffD9D9D9).withOpacity(0.1),
                                height: 40.00.h, width: 150.00.w,
                                // padding: const EdgeInsets.only(
                                //   left: 20,
                                //   right: 20,
                                // ),
                                child: TextFormField(
                                  //controller: profileController.firstname,
                                  controller: dashboardcontroller.todate,
                                  readOnly:
                                      true, //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(
                                            2000), //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dashboardcontroller.todate.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {
                                      print("Date is not selected");
                                    }
                                  },

                                  style: tablestyle,
                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: const BorderSide(
                                            color: appcolor, width: 1),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.black.withOpacity(0.1),
                                            width: 1),
                                      ),
                                      fillColor: const Color(0xffC6C6C6),
                                      hintText: 'Select to date',
                                      prefixIcon: Icon(
                                        Icons.calendar_month,
                                        color: appbarcolor,
                                        size: 20,
                                      ),
                                      contentPadding:
                                          const EdgeInsets.only(left: 20),
                                      hintStyle: GoogleFonts.jost(
                                          textStyle: TextStyle(
                                              fontSize: 10.00.sp,
                                              color: formhintcolor,
                                              fontWeight: FontWeight.w500)),
                                      border: const OutlineInputBorder(
                                        gapPadding: 4,
                                      )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                onTap: () async {
                                  setState(
                                    () async {
                                      Get.back();
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  child: Center(
                                      child: Text(
                                    'Cancel',
                                    style: headingcolor,
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () async {
                                  setState(
                                    () async {
                                      SharedPreferences sharedPreferences =
                                          await SharedPreferences.getInstance();
                                      var storeid = sharedPreferences
                                          .getString(Constants.storeid);
                                      dashboardcontroller
                                          .dahboardcontroller(
                                            storeid,
                                          )
                                          .then((value) => Get.back());
                                    },
                                  );
                                },
                                child: Container(
                                  height: 30.0.h,
                                  width: 70.0.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: appbarcolor,
                                  ),
                                  child: Center(
                                      child: Text(
                                    'ok',
                                    style: headingcolor,
                                  )),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                }),
              );
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
              Categories(),
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         'Coupon won ',
              //         style: listtitle,
              //       ),
              //       InkWell(
              //         onTap: () {
              //           ////kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk
              //           // Get.toNamed('/couponwon');
              //           // Get.to(CouponwonPage(
              //           //     name: couponWonController
              //           //         .listData[0].title[0].title1
              //           //         .toString(),
              //           //     coupon: couponWonController
              //           //         .listData[0].title[0].title2
              //           //         .toString(),
              //           //     date: couponWonController
              //           //         .listData[0].title[0].title3
              //           //         .toString()));
              //         },
              //         child: Padding(
              //           padding: EdgeInsets.only(right: 25.0),
              //           child: Container(
              //             width: 80.0.w,
              //             height: 30.0.h,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(5),
              //               //color: Colors.amber[900],
              //             ),
              //             child: Center(
              //               child: Row(
              //                 // mainAxisAlignment: MainAxisAlignment.spaceAround,
              //                 children: [
              //                   Text(
              //                     'Readmore',
              //                     style: GoogleFonts.poppins(
              //                         textStyle: TextStyle(
              //                             fontSize: 10.00.sp,
              //                             color: Colors.grey,
              //                             fontWeight: FontWeight.w500)),
              //                   ),
              //                   Icon(
              //                     Icons.double_arrow,
              //                     color: formhintcolor,
              //                     size: 15,
              //                   ),
              //                 ],
              //               ),
              //             ),
              //           ),
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Obx(() {
              //   if (couponWonController.couponLoading.value) {
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (couponWonController.listData.isEmpty) {
              //     return Center(
              //       child: Text('NO DATA FOUND'),
              //     );
              //   } else {
              //     return Padding(
              //       padding: const EdgeInsets.only(left: 23.0, right: 23.0),
              //       child: Container(
              //           height: 30.0.h,
              //           width: 500.0.w,
              //           decoration: BoxDecoration(
              //               color: appbarcolor,
              //               borderRadius: BorderRadius.circular(5)),
              //           child: ListView.builder(
              //               itemCount:
              //                   couponWonController.listData[0].title.length,
              //               itemBuilder: (context, index) {
              //                 return Padding(
              //                   padding: const EdgeInsets.all(8.0),
              //                   child: Row(
              //                     // mainAxisAlignment:
              //                     //     MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Container(
              //                         width: 120.0.w,
              //                         child: Text(
              //                           couponWonController
              //                               .listData[0].title[index].title1
              //                               .toString(),
              //                           style: viewdetails,
              //                         ),
              //                       ),
              //                       Container(
              //                         width: 120.0.w,
              //                         child: Text(
              //                           couponWonController
              //                               .listData[0].title[index].title2
              //                               .toString(),
              //                           style: viewdetails,
              //                         ),
              //                       ),
              //                       Container(
              //                         // width: 120.0.w,
              //                         child: Text(
              //                           couponWonController
              //                               .listData[0].title[index].title3
              //                               .toString(),
              //                           style: viewdetails,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 );
              //               })),
              //     );
              //   }
              // }),
              // Obx(() {
              //   if (couponWonController.couponLoading.value) {
              //     return Center(
              //       child: CircularProgressIndicator(),
              //     );
              //   } else if (couponWonController.listData.isEmpty) {
              //     return Center(
              //       child: Text('NO DATA FOUND'),
              //     );
              //   } else {
              //     return Padding(
              //       padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              //       child: Container(
              //           height: 150.0.h,
              //           width: 1000.0.w,
              //           child: Card(
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.start,
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   child: ListView.builder(
              //                       shrinkWrap: true,
              //                       physics: NeverScrollableScrollPhysics(),
              //                       itemCount: 4,
              //                       itemBuilder: (context, index) {
              //                         var couponname = couponWonController
              //                             .listData[0].data[index];
              //                         return Padding(
              //                           padding: const EdgeInsets.only(
              //                               left: 8.0, top: 20.0, right: 8.0),
              //                           child: Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,

              //                             //  crossAxisAlignment: CrossAxisAlignment.start,
              //                             children: [
              //                               Container(
              //                                   width: 80.0.w,
              //                                   child: Row(
              //                                     children: <Widget>[
              //                                       Flexible(
              //                                         child: new Text(
              //                                           couponname.name
              //                                               .toString(),
              //                                           style: listtitlecolor,
              //                                         ),
              //                                       )
              //                                     ],
              //                                   )),
              //                               Container(
              //                                   width: 50.0.w,
              //                                   child: Row(
              //                                     children: <Widget>[
              //                                       Flexible(
              //                                         child: new Text(
              //                                           couponname.title
              //                                               .toString(),
              //                                           style: listtitlecolor,
              //                                         ),
              //                                       )
              //                                     ],
              //                                   )),
              //                               Container(
              //                                   width: 100.0.w,
              //                                   child: Row(
              //                                     children: <Widget>[
              //                                       Flexible(
              //                                         child: new Text(
              //                                           couponname.timeAdded
              //                                               .toString(),
              //                                           style: listtitlecolor,
              //                                         ),
              //                                       )
              //                                     ],
              //                                   )),
              //                             ],
              //                           ),
              //                         );
              //                       }),
              //                 )
              //               ],
              //             ),
              //           )),
              //     );
              //   }
              // }),
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
