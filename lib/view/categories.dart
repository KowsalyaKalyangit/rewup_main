import 'package:rewup/view/dashboard/coupondetails_page.dart';
import 'package:rewup/view/dashboard/efficiency_page.dart';
import 'package:rewup/view/dashboard/game_details.dart';

import '../allpackages.dart';
import '../controller/coupon_won_controller.dart';
import '../controller/getdetails_controller.dart';

import 'dashboard/chatsurvey.dart';
import 'dashboard/customer_details.dart';
import 'dashboard/pie_chart.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  var categorynames = ['Coupon', 'Customers', 'Chat survey'];

  var count = ['16', '16', '0'];
  var selectedindex = 0;
  var images = [
    'assets/images/4.png',
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png'
  ];
  DetailsController detailsController = Get.put(DetailsController());
  CouponWonController couponWonController = Get.put(CouponWonController());

  @override
  void initState() {
    //  detailsController.getDetailController();

    super.initState();
  }

  // Group Value for Radio Button.

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              height: 220.0.h,
              width: 1000.0.w,
              padding: EdgeInsets.all(5.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  // scrollDirection: Axis.vertical,

                  ///physics: NeverScrollableScrollPhysics(),
                  itemCount: count.length,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 600 / 3,
                      childAspectRatio: 5 / 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 5),
                  itemBuilder: (BuildContext context, index) {
                    //var listdata = detailsController.listData[index];
                    return InkWell(
                      onTap: () {
                        if (index == 0) {
                          Get.to(CouponDetailsPage());
                        }

                        if (index == 1) {
                          Get.to(CustomerDetailsPage());
                        }
                        if (index == 2) {
                          Get.to(ChatSurvey());
                        }
                      },
                      child: Card(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Container(
                              //     height: 35.h,
                              //     child: Image.asset(images[index])),
                              Text(
                                categorynames[index],
                                style: homepagecount,
                              ),
                              Text(
                                count[index].toString(),
                                style: homepagecountcolor,
                              ),
                            ]),
                      ),
                    );
                  })),
          Padding(
            padding: const EdgeInsets.only(left: 5.0, right: 5.0),
            child: Container(
              height: 340.h,
              width: 1000.w,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text(
                        'Efficiency',
                        style: listtitle,
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: Colors.amber[900],
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                'No of Customers',
                                style: tablestyle,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: appbarcolor,
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                'Repeaters',
                                style: tablestyle,
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 15.0.h,
                                width: 15.0.w,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 10.0.w,
                              ),
                              Text(
                                'Utilized',
                                style: tablestyle,
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      // EffieciencyPage(),
                      // Container(
                      //     child: Image.asset(
                      //   'assets/images/chart1.png',
                      //   height: 250.0.h,
                      // )),

                      BarChartExample()
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
