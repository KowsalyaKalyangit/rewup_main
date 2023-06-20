import 'package:rewup/controller/get_game_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../utils/constants.dart';
import 'game_category_details.dart';

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
          centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Get.offAll(HomeScreen());
                  },
                  child: Icon(Icons.arrow_back))),
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Container(
                    height: 900.h,
                    width: 500.w,
                    child: ListView.builder(
                        itemCount: gameController.listData[0].data.length,
                        itemBuilder: (context, index) {
                          var gamedata = gameController.listData[0].data[index];
                          return Container(
                              height: 90.0.h,
                              width: 500.0.w,
                              //  margin: EdgeInsets.all(5),
                              child: InkWell(
                                onTap: () {
                                  Get.to(GameCategoriesDetails(
                                      index: index,
                                      id: gamedata.id.toString()));
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: Image.network(
                                                    gameController.listData[0]
                                                        .data[index].gameimage
                                                        .toString(),
                                                    height: 50.0.h,
                                                    width: 50.0.w,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Store:',
                                                          style:
                                                              listStyleappcolor,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Text(
                                                          gameController
                                                              .listData[0]
                                                              .data[index]
                                                              .store,
                                                          style: listStyle,
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          'Game:',
                                                          style:
                                                              listStyleappcolor,
                                                        ),
                                                        SizedBox(
                                                          width: 5,
                                                        ),
                                                        Container(
                                                          width: 120.0.w,
                                                          child: Text(
                                                            gameController
                                                                .listData[0]
                                                                .data[index]
                                                                .game,
                                                            style: listStyle,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 38,
                                                        ),
                                                        Icon(
                                                          Icons
                                                              .arrow_right_outlined,
                                                          color: Colors.grey,
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
                                                      gameController
                                                          .listData[0]
                                                          .data[index]
                                                          .redirectUrl,
                                                      style: GoogleFonts.jost(
                                                          textStyle: TextStyle(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              letterSpacing:
                                                                  0.2,
                                                              fontSize: 9.00.sp,
                                                              color:
                                                                  Colors.blue,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700)),
                                                    ),
                                                  ],
                                                ),
                                              ),
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
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
