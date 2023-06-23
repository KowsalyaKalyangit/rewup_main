// import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:rewup/controller/graph_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../allpackages.dart';
import '../../controller/dashboard_controller.dart';
import '../../utils/constants.dart';
import 'package:flutter_charts/flutter_charts.dart';

class BarChartExample extends StatefulWidget {
  @override
  _BarChartExampleState createState() => _BarChartExampleState();
}

class _BarChartExampleState extends State<BarChartExample> {
  GraphController graphController = Get.put(GraphController());
  Dashboardcontroller dashboardcontroller = Get.put(Dashboardcontroller());
  var itemdata = ['No of customers', 'Repeaters', 'Utilized'];
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var storeid = sharedPreferences.getString(Constants.storeid);
    setState(() {
      graphController.getGraphController(storeid.toString());
      dashboardcontroller.dahboardcontroller(storeid);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (graphController.isgraphLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (graphController.listData.isEmpty) {
        return Center(
          child: Text('No Data Found '),
        );
      } else {
        return Container(
          height: 230.0.h,
          width: 500.0.w,
          child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: graphController.listData.length,
              itemBuilder: (context, index) {
                var data = graphController.listData[index];
                return Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 1.5,
                      child: BarChart(BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          barTouchData: BarTouchData(enabled: false),

                          //  barTouchData: BarTouchData(),
                          maxY: data.totalcustomers.toDouble() + 200,
                          minY: 0,
                          titlesData: FlTitlesData(
                              show: true,
                              rightTitles: AxisTitles(),
                              topTitles: AxisTitles(),
                              bottomTitles: AxisTitles(
                                  axisNameWidget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    itemdata[0].toString(),
                                    style: listStyle,
                                  ),
                                  Text(itemdata[1].toString()),
                                  Text(itemdata[2].toString()),
                                ],
                              ))),
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                  toY: data.totalcustomers.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: Colors.amber[900])
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                  toY: data.repeatcustomers.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: appbarcolor)
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                  toY: data.utilized.toDouble(),
                                  width: 25.0.w,
                                  borderRadius: BorderRadius.zero,
                                  color: Colors.green)
                            ]),
                          ])),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          data.totalcustomers.toString(),
                          style: tablestyle,
                        ),
                        Text(
                          data.repeatcustomers.toString(),
                          style: tablestyle,
                        ),
                        Text(
                          data.utilized.toString(),
                          style: tablestyle,
                        ),
                      ],
                    )
                  ],
                );
              }),
        );
      }
    });
  }
}
