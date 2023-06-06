import 'package:rewup/view/profile/profile_details.dart';

import '../../../../allpackages.dart';
import '../controller/login_controller.dart';
import 'dashboard/game_details.dart';
import 'dashboard/reportpage_csv.dart';
import 'dashboard/store_details_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  int _currentIndex = 0;
  LoginController loginController = Get.put(LoginController());
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<Map<String, Widget>> _pages = [
    {
      'page': const HomePage(),
    },
    {
      'page': const GameDetailsPage(),
    },
    // {
    //   'page': const DetailsPage(),
    // },
    {
      'page': const ReportPage(),
    },
    {
      'page': const StoreDetailsPage(),
    },
    {
      'page': const MenuScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        //appBar: getappbar(),
        drawer: Drawer(
          backgroundColor: screenbackground,
          child: Column(children: [
            UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: appcolor),
                accountName: Text(
                  'Tony Rajesh',
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text(
                  "tonyrajesh@gmail.com",
                  style: TextStyle(
                      color: screenbackground,
                      decoration: TextDecoration.underline),
                ),
                //currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                    'assets/images/profile.jpg',
                  ),
                )),
            ListTile(
              leading: const Icon(
                Icons.storefront_outlined,
                color: toptitlecolor,
              ),
              title: InkWell(
                focusColor: Colors.blue.withOpacity(0.4),
                onTap: () {
                  Get.back();
                  Get.to(StoreDetailsPage());
                },
                child: Container(
                  width: 30.0.w,
                  child: Text(
                    'Store',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            // ListTile(
            //   leading: const Icon(
            //     Icons.login,
            //     color: toptitlecolor,
            //   ),
            //   title: InkWell(
            //     focusColor: Colors.blue.withOpacity(0.4),
            //     onTap: () {
            //       Get.back();
            //     },
            //     child: Container(
            //       width: 30.0.w,
            //       child: Text(
            //         'Login',
            //         style: TextStyle(color: toptitlecolor),
            //       ),
            //     ),
            //   ),
            // ),
            ListTile(
              leading: const Icon(
                Icons.logout_outlined,
                color: toptitlecolor,
              ),
              title: InkWell(
                focusColor: Colors.blue.withOpacity(0.4),
                onTap: () {
                  loginController.logout();
                },
                child: Container(
                  width: 30.0.w,
                  child: Text(
                    'Logout ',
                    style: TextStyle(color: toptitlecolor),
                  ),
                ),
              ),

              //UserAccountDrawerHeader
            )
          ]),
        ),
        backgroundColor: bgcolor,
        body: _pages[_currentIndex]['page'],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 3.0, right: 3, bottom: 5),
          child: BottomNavyBar(
            containerHeight: 70,
            selectedIndex: _currentIndex,
            showElevation: false,
            itemCornerRadius: 24,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            curve: Curves.easeIn,
            onItemSelected: (index) => setState(() => _currentIndex = index),
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.home,
                  size: 20,
                ),
                title: Text('Home'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.gamepad_outlined,
                  size: 20,
                ),
                title: Text('Game'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.report_outlined,
                  size: 20,
                ),
                title: Text('Report'),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.storefront_outlined,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text(
                    'Store',
                    // style: GoogleFonts.poppins(
                    //     textStyle: TextStyle(
                    //         letterSpacing: 1,
                    //         fontSize: 9.00.sp,
                    //         color: Colors.white,
                    //         fontWeight: FontWeight.w700)),
                  ),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
              BottomNavyBarItem(
                icon: const Icon(
                  Icons.person_outline,
                  size: 20,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 1.0),
                  child: Text('Profile'),
                ),
                activeColor: appcolor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}

class AddtoCart extends StatefulWidget {
  const AddtoCart({super.key});

  @override
  State<AddtoCart> createState() => _AddtoCartState();
}

class _AddtoCartState extends State<AddtoCart> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
