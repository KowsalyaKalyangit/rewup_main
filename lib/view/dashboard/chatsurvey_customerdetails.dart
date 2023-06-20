import 'package:rewup/view/dashboard/customerchatdetails.dart';
 

import '../../allpackages.dart';

import '../../controller/survey_customerdetails_controller.dart';
 

class ChatSurveyCustomerDetails extends StatefulWidget {
  const ChatSurveyCustomerDetails({super.key, this.chatid});
  final String? chatid;
  @override
  State<ChatSurveyCustomerDetails> createState() =>
      _ChatSurveyCustomerDetailsState();
}

class _ChatSurveyCustomerDetailsState extends State<ChatSurveyCustomerDetails> {
  ChatSurveyCustomerDetailsController chatSurveyCustomerDetailsController =
      Get.put(ChatSurveyCustomerDetailsController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //  var storeid = sharedPreferences.getString(Constants.storeid);
    chatSurveyCustomerDetailsController
        .getChatSurveyCustomerDetailsController(widget.chatid.toString());
  }

  final DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (chatSurveyCustomerDetailsController.ischatsurveyLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (chatSurveyCustomerDetailsController
            .listData[0].data.isEmpty) {
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
                // actions: [
                //   Padding(
                //     padding: EdgeInsets.only(right: 15.0),
                //     child: InkWell(
                //       onTap: (() {}),
                //       child: Icon(
                //         Icons.shopping_cart,
                //         color: screenbackground,
                //         size: 22,
                //       ),
                //     ),
                //   ),
                //   Padding(
                //     padding: EdgeInsets.only(right: 15.0),
                //     child: InkWell(
                //       onTap: (() {}),
                //       child: Icon(
                //         Icons.notifications_on,
                //         color: screenbackground,
                //         size: 22,
                //       ),
                //     ),
                //   ),
                // ],
                title: Text(
                  'Customer Details',
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
                    height: 1000.h,
                    width: 500.w,
                    child: ListView.builder(
                        itemCount: chatSurveyCustomerDetailsController
                            .listData[0].data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 80.0.h,
                              width: 500.0.w,
                              //  margin: EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  Get.to(CustomerchatDetails(
                                      customerid:
                                          chatSurveyCustomerDetailsController
                                              .listData[0].data[index].id
                                              .toString()));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Card(
                                        child: ListTile(
                                      title: Text(
                                        chatSurveyCustomerDetailsController
                                            .listData[0].data[index].name
                                            .toString(),
                                        style: listStyle,
                                      ),
                                      subtitle: Text(
                                        chatSurveyCustomerDetailsController
                                            .listData[0].data[index].email
                                            .toString(),
                                        style: listStyle,
                                      ),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      ),
                                      leading: CircleAvatar(
                                        backgroundColor: appbarcolor,
                                        child: Text(
                                          chatSurveyCustomerDetailsController
                                              .listData[0].data[index].name[0]
                                              .toString(),
                                          style: menuprofilesection,
                                        ),
                                      ),
                                    )),
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
