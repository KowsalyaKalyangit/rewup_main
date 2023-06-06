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
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: InkWell(
                      onTap: (() {}),
                      child: Icon(
                        Icons.shopping_cart,
                        color: screenbackground,
                        size: 22,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.0),
                    child: InkWell(
                      onTap: (() {}),
                      child: Icon(
                        Icons.notifications_on,
                        color: screenbackground,
                        size: 22,
                      ),
                    ),
                  ),
                ],
                title: Text(
                  'Coupons',
                  style: heading,
                )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Row(
                  //   children: [
                  //     Container(
                  //       padding:
                  //           EdgeInsets.only(left: 10.0, right: 10.0, top: 10),
                  //       height: 60.0.h,
                  //       width: 250.0.w,
                  //       child: GestureDetector(
                  //         child: TextFormField(
                  //           style: listStyle,
                  //           decoration: InputDecoration(
                  //               prefixIcon: const Icon(
                  //                 Icons.search,
                  //                 color: appcolor,
                  //               ),
                  //               suffixIcon: const Icon(
                  //                 Icons.mic,
                  //                 color: appcolor,
                  //               ),
                  //               focusedBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(5.0),
                  //                 borderSide: const BorderSide(
                  //                     color: appcolor, width: 1),
                  //               ),
                  //               enabledBorder: OutlineInputBorder(
                  //                 borderRadius: BorderRadius.circular(5.0),
                  //                 borderSide: const BorderSide(
                  //                     color: formhintcolor, width: 1),
                  //               ),
                  //               fillColor: const Color(0xffC6C6C6),
                  //               hintText: 'Search your products',
                  //               contentPadding: const EdgeInsets.only(left: 10),
                  //               hintStyle: formhintstylesearch,
                  //               border: const OutlineInputBorder(
                  //                 gapPadding: 4,
                  //               )),
                  //         ),
                  //       ),
                  //     ),
                  //     Container(
                  //       height: 50.0.h,
                  //       width: 100.0.w,
                  //       child: Card(
                  //         child: ListTile(
                  //           title: const Icon(Icons.filter_alt_outlined),
                  //           trailing: Text(
                  //             'Filter',
                  //             style: listStyle,
                  //           ),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  Container(
                    height: 40.0.h,
                    width: 500.0.w,
                    color: Color.fromARGB(255, 232, 232, 235),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Title',
                          style: listStyleappcolor,
                        ),
                        Text(
                          'Store',
                          style: listStyleappcolor,
                        ),
                        Text(
                          'Category',
                          style: listStyleappcolor,
                        ),

                        // Text(
                        //   'Address',
                        //   style: listStyleappcolor,
                        // ),
                      ],
                    ),
                  ),
                  Container(
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
                                              const Text('Coupon Code'),
                                            ],
                                          ),
                                          content: SingleChildScrollView(
                                            child: ListBody(
                                              children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    height: 30.0.h,
                                                    width: 100.0.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: appbarcolor),
                                                    child: Center(
                                                      child: Text(
                                                          couponController
                                                              .listData[0]
                                                              .data[index]
                                                              .title,
                                                          style: headingcolor),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('ok'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Card(
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
                                          couponController
                                              .listData[0].data[index].category,
                                          style: tablestyle)
                                    ],
                                  ),
                                ),
                              ));
                        }),
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
