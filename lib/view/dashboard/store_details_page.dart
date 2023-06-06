// ignore_for_file: unnecessary_null_comparison

import 'package:rewup/controller/getstore_controller.dart';

import '../../allpackages.dart';

class StoreDetailsPage extends StatefulWidget {
  const StoreDetailsPage({super.key});

  @override
  State<StoreDetailsPage> createState() => _StoreDetailsPageState();
}

class _StoreDetailsPageState extends State<StoreDetailsPage> {
  StoreController storeController = Get.put(StoreController());
  @override
  void initState() {
    storeController.getStoreController();
    super.initState();
  }

  bool _isPinnewHidden = false;
  bool showText = false;
  void _togglecnewPinView() {
    setState(() {
      _isPinnewHidden = !_isPinnewHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            'Store Details',
            style: heading,
          )),
      body: Obx(() {
        if (storeController.isStoreLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (storeController.listData.isEmpty) {
          return Center(child: Text('No Data Found'));
        } else {
          return SingleChildScrollView(
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
                //                 borderSide:
                //                     const BorderSide(color: appcolor, width: 1),
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
                      itemCount: storeController.listData[0].data.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 120.0.h,
                            width: 500.0.w,
                            //  margin: EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  child: Card(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0, right: 20.0),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CircleAvatar(
                                                radius: 30,
                                                backgroundColor:
                                                    Color(0xfffbcd20),
                                                child: CircleAvatar(
                                                    radius: 25,
                                                    backgroundColor:
                                                        appbarcolor,
                                                    backgroundImage:
                                                        NetworkImage(
                                                      storeController
                                                          .listData[0]
                                                          .data[index]
                                                          .image,
                                                    )),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Name:',
                                                        style:
                                                            listStyleappcolor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        storeController
                                                            .listData[0]
                                                            .data[index]
                                                            .name,
                                                        style: listStyle,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Coupon Count:',
                                                        style:
                                                            listStyleappcolor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        storeController
                                                            .listData[0]
                                                            .data[index]
                                                            .couponcount
                                                            .toString(),
                                                        style: listStyle,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'User Name:',
                                                        style:
                                                            listStyleappcolor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Text(
                                                        storeController
                                                            .listData[0]
                                                            .data[index]
                                                            .username
                                                            .toString(),
                                                        style: listStyle,
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        'Ran Value:',
                                                        style:
                                                            listStyleappcolor,
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      showText
                                                          ? Visibility(
                                                              visible: showText,
                                                              child: Text(
                                                                storeController
                                                                    .listData[0]
                                                                    .data[index]
                                                                    .ranValue
                                                                    .toString(),
                                                                style:
                                                                    listStyle,
                                                              ))
                                                          : Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 8.0),
                                                              child: Text(
                                                                '******',
                                                                style:
                                                                    forminputstyle,
                                                              ),
                                                            ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            showText =
                                                                !showText;
                                                          });
                                                        },
                                                        child: Icon(
                                                            showText
                                                                ? Icons
                                                                    .visibility
                                                                : Icons
                                                                    .visibility_off,
                                                            size: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.025,
                                                            color:
                                                                formhintcolor),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                      }),
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
