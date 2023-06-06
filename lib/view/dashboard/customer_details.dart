import 'package:rewup/controller/customer_details_controller.dart';

import '../../allpackages.dart';

class CustomerDetailsPage extends StatefulWidget {
  const CustomerDetailsPage({super.key, this.chatid});
  final String? chatid;
  @override
  State<CustomerDetailsPage> createState() => _CustomerDetailsPageState();
}

class _CustomerDetailsPageState extends State<CustomerDetailsPage> {
  CustomerDetailsController customerDetailsController =
      Get.put(CustomerDetailsController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // var storeid = sharedPreferences.getString(Constants.storeid);
    customerDetailsController.getCustomerDetailsController();
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (customerDetailsController.isCustomerloading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (customerDetailsController.listData.isEmpty) {
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
                  'Customer Details',
                  style: heading,
                )),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 65.0.h,
                    width: 1000.0.w,
                    decoration: BoxDecoration(
                        color: Color(0xff423592).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Customer Name',
                              style: tablestyle,
                            ),
                            Text(
                              'Email_id',
                              style: tablestyle,
                            ),
                            Text(
                              'Phone Number',
                              style: tablestyle,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 900.h,
                    width: 500.w,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:
                            customerDetailsController.listData[0].data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 70.0.h,
                            width: 500.0.w,
                            //  margin: EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                // Get.to(CustomerchatDetails(
                                //     customerid: customerDetailsController
                                //         .listData[0].data[index].id
                                //         .toString()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    child: Card(
                                        elevation: 0.5,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                                width: 80.0.w,
                                                child: Row(
                                                  children: <Widget>[
                                                    Flexible(
                                                      child: new Text(
                                                        customerDetailsController
                                                            .listData[0]
                                                            .data[index]
                                                            .name
                                                            .toString(),
                                                        style: customerstyle,
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
                                                            customerDetailsController
                                                                .listData[0]
                                                                .data[index]
                                                                .email
                                                                .toString(),
                                                            style: GoogleFonts.poppins(
                                                                textStyle: TextStyle(
                                                                    letterSpacing:
                                                                        0.2,
                                                                    fontSize:
                                                                        8.00.sp,
                                                                    color:
                                                                        appbarcolor,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700)))),
                                                  ],
                                                )),
                                            Text(
                                              customerDetailsController
                                                  .listData[0].data[index].phone
                                                  .toString(),
                                              style: customerstyle,
                                            ),
                                          ],
                                        ))),
                              ),
                            ),
                          );
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
