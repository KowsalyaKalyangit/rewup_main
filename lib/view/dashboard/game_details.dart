import 'package:rewup/controller/get_game_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';

class GameDetailsPage extends StatefulWidget {
  const GameDetailsPage({super.key});

  @override
  State<GameDetailsPage> createState() => _GameDetailsPageState();
}

class _GameDetailsPageState extends State<GameDetailsPage> {
  GameController gameController = Get.put(GameController());
  @override
  void initState() {
    fun();

    super.initState();
  }

  fun() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    gameController.getGameController(storeid.toString());
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
            'Game',
            style: heading,
          )),
      body: Obx(() {
        if (gameController.isgameLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else if (gameController.listData.isEmpty) {
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
                      itemCount: gameController.listData[0].data.length,
                      itemBuilder: (context, index) {
                        return Container(
                            height: 150.0.h,
                            width: 500.0.w,
                            //  margin: EdgeInsets.all(5),
                            child: InkWell(
                              onTap: () {
                                print(gameController
                                    .listData[0].data[index].gameimg);
                              },
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
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              // child: gameController
                                              //             .listData[0]
                                              //             .data[index]
                                              //             .chatbg !=
                                              //         null
                                              //     ? Image.network(
                                              //         gameController
                                              //             .listData[0]
                                              //             .data[index]
                                              //             .chatbg,
                                              //         height: 120.0.h,
                                              //         width: 150.0.w,
                                              //         fit: BoxFit.cover,
                                              //       )
                                              child: Image.network(
                                                gameController.listData[0]
                                                    .data[index].gameimg
                                                    .toString(),
                                                height: 100.0.h,
                                                width: 120.0.w,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Store:',
                                                      style: listStyleappcolor,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      gameController.listData[0]
                                                          .data[index].store,
                                                      style: listStyle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Game:',
                                                      style: listStyleappcolor,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      gameController.listData[0]
                                                          .data[index].game,
                                                      style: listStyle,
                                                    )
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Qr Code:',
                                                      style: listStyleappcolor,
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        print(gameController
                                                            .listData[0]
                                                            .data[index]
                                                            .qrcode);
                                                        showDialog<void>(
                                                            context: context,
                                                            barrierDismissible:
                                                                false, // user must tap button!
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return AlertDialog(
                                                                title: const Text(
                                                                    'Qr Code'),
                                                                content:
                                                                    SingleChildScrollView(
                                                                  child:
                                                                      ListBody(
                                                                    children: <Widget>[
                                                                      Image.network(gameController
                                                                          .listData[
                                                                              0]
                                                                          .data[
                                                                              index]
                                                                          .qrcode)
                                                                    ],
                                                                  ),
                                                                ),
                                                                actions: <Widget>[
                                                                  Container(
                                                                    height:
                                                                        30.0.h,
                                                                    width:
                                                                        50.0.w,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                10),
                                                                        border: Border.all(
                                                                            color:
                                                                                appcolor)),
                                                                    child:
                                                                        TextButton(
                                                                      child:
                                                                          Text(
                                                                        'Ok',
                                                                        style:
                                                                            listStyleappcolor,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            });
                                                      },
                                                      child: Image.network(
                                                        gameController
                                                            .listData[0]
                                                            .data[index]
                                                            .qrcode,
                                                        height: 20,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                // Row(
                                                //   children: [
                                                //     Text(
                                                //       'Redirect_url:',
                                                //       style:
                                                //           listStyleappcolor,
                                                //     ),
                                                //     SizedBox(
                                                //       width: 5,
                                                //     ),
                                                //   ],
                                                // ),
                                                Text(
                                                  gameController.listData[0]
                                                      .data[index].redirectUrl,
                                                  style: GoogleFonts.jost(
                                                      textStyle: TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          letterSpacing: 0.2,
                                                          fontSize: 9.00.sp,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                                ),
                                                Text(
                                                  'Coupon:',
                                                  style: listStyleappcolor,
                                                ),
                                                SizedBox(
                                                  width: 150.0.w,
                                                  child: Text(
                                                      gameController.listData[0]
                                                          .data[index].coupon
                                                          .toString(),
                                                      maxLines: 3,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              letterSpacing:
                                                                  0.2,
                                                              fontSize:
                                                                  10.00.sp,
                                                              color: Colors
                                                                  .green[900],
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700))),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
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
