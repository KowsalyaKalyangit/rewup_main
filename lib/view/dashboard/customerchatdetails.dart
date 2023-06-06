import '../../allpackages.dart';

import '../../controller/customerchatdetails_controller.dart';

import '../../utils/faq_fun.dart';

class CustomerchatDetails extends StatefulWidget {
  const CustomerchatDetails({super.key, this.customerid});
  final String? customerid;
  @override
  State<CustomerchatDetails> createState() => _CustomerchatDetailsState();
}

class _CustomerchatDetailsState extends State<CustomerchatDetails> {
  CustomerChatDetailsController CustomerchatDetailsController =
      Get.put(CustomerChatDetailsController());
  @override
  void initState() {
    print('customer*************');
    print(widget.customerid.toString());
    fun();

    super.initState();
  }

  fun() async {
    //SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //var storeid = sharedPreferences.getString(Constants.storeid);
    CustomerchatDetailsController.getCustomerChatDetailsController(
        widget.customerid.toString());
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (CustomerchatDetailsController.ischatsurveyLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (CustomerchatDetailsController.listData.isEmpty) {
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
                  'Customer Chat Details',
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
                    height: 900.h,
                    width: 500.w,
                    child: ListView.builder(
                        itemCount: CustomerchatDetailsController
                            .listData[0].data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: FAQ(
                                    question: CustomerchatDetailsController
                                        .listData[0].data[index].question
                                        .toString(),
                                    answer: CustomerchatDetailsController
                                        .listData[0].data[index].answers
                                        .toString(),
                                    ansStyle: listStyle,
                                    queStyle: listStyleappcolor),
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
