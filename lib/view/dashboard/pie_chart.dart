import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/controller/graph_controller.dart';
import 'package:rewup/controller/pie_chart_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants.dart';

class PieChartPage extends StatefulWidget {
  @override
  State<PieChartPage> createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  PieChartcontroller pieChartcontroller = Get.put(PieChartcontroller());
  // final List<PieChartSectionData> pieChartData = [
  //   PieChartSectionData(
  //     value: 40,
  //     color: Colors.red,
  //     title: 'Red',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 30,
  //     color: Colors.blue,
  //     title: 'Blue',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 15,
  //     color: Colors.green,
  //     title: 'Green',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  //   PieChartSectionData(
  //     value: 15,
  //     color: Colors.yellow,
  //     title: 'Yellow',
  //     radius: 80,
  //     titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
  //   ),
  // ];
  @override
  void initState() {
    fun();
    super.initState();
  }

  fun() async {
    pieChartcontroller.piechartController();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (pieChartcontroller.ispieLoad.value) {
        return Center(child: CircularProgressIndicator());
      } else if (pieChartcontroller.listData.isEmpty) {
        return Text('No Data Found');
      } else {
        return Container(
          height: 100.0.h,
          width: 1000.0.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 100.0.w,
                child: PieChart(
                  PieChartData(
                    sections: [
                      PieChartSectionData(
                          value: pieChartcontroller.listData[0].totalCouponwon
                              .toDouble(),
                          color: Colors.amber[700],
                          // title: 'totalcouponwon',
                          radius: 40,
                          titleStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      PieChartSectionData(
                          value: pieChartcontroller
                                      .listData[0].totalCouponutilized ==
                                  ''
                              ? pieChartcontroller
                                  .listData[0].totalCouponutilized
                                  .toDouble()
                              : 0.0,
                          color: Colors.blueAccent,
                          //title: ' utilized',
                          radius: 40,
                          titleStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                      PieChartSectionData(
                          value: pieChartcontroller
                              .listData[0].totalCouponunutilized
                              .toDouble(),
                          color: Colors.purple[800],
                          // title: 'unutilized',
                          radius: 40,
                          titleStyle: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ],
                    centerSpaceRadius: 30,
                    borderData: FlBorderData(show: false),
                    sectionsSpace: 0,
                  ),
                ),
              ),
              Container(
                height: 100.0.h,
                width: 150.0.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 15.0.h,
                          width: 15.0.w,
                          color: Colors.amber[700],
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Total Couponwon',
                          style: tablestyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                            height: 15.0.h,
                            width: 15.0.w,
                            color: Colors.blueAccent),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Total Couponutilized',
                          style: tablestyle,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 15.0.h,
                          width: 15.0.w,
                          color: Colors.purple[800],
                        ),
                        SizedBox(
                          width: 10.0.w,
                        ),
                        Text(
                          'Total Couponunutilized',
                          style: tablestyle,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
