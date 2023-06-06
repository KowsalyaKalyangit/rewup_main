import '../allpackages.dart';

import '../controller/getdetails_controller.dart';

import 'dashboard/couponwon_page.dart';
import 'dashboard/pie_chart.dart';
import 'dashboard/report_coupon_page.dart';
import 'dashboard/store_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DetailsController detailsController = Get.put(DetailsController());

  @override
  void initState() {
    // detailsController.getDetailController();

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
      toolbarHeight: 80.0.h,
      leading: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello Marina',
              style: toptitleappcolor,
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Text(
              'Today you had 7 participants',
              style: appbarstyle,
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              setState(() {
                _selectDate(context);
              });
            },
            child: Icon(
              Icons.calendar_month_outlined,
              color: screenbackground,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: InkWell(
            onTap: () {
              Get.to(StoreDetailsPage());
            },
            child: Icon(
              Icons.person_3_outlined,
              color: screenbackground,
            ),
          ),
        ),
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
              // Card(
              //   child: ListTile(
              //     title: Text(
              //       'Welcome',
              //       style: toptitleappcolor,
              //     ),
              //     trailing: SizedBox(
              //       width: 50.0.w,
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           InkWell(
              //             onTap: () {
              //               setState(() {
              //                 _selectDate(context);
              //               });
              //             },
              //             child: Icon(
              //               Icons.calendar_month_outlined,
              //               color: toptitlecolor,
              //             ),
              //           ),
              //           Icon(
              //             Icons.person_3_outlined,
              //             color: toptitlecolor,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              Categories(),
              CouponwonPage(),

              SizedBox(
                height: 10.0.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Container(
                  height: 250.0.h,
                  width: 800.0.w,
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Coupon Chart',
                          style: listtitle,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Center(
                          child:
                              Container(height: 200.h, child: PieChartPage()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ReportCouponPage()
            ]),
      ),
    );
  }
}
