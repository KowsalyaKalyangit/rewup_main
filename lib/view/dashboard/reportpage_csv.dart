import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rewup/controller/exportcsv2_controller.dart';
import 'package:rewup/controller/exportdetails-csv_controller.dart';

import '../../utils/colors.dart';
import '../../utils/textstyles.dart';
import 'package:intl/intl.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController fromdate = TextEditingController();
  TextEditingController todate = TextEditingController();
  double? _progress;
  double? _progress1;
  @override
  void initState() {
    fromdate.text = ""; //set the initial value of text field
    todate.text = "";
    exportDetailsCSV2Controller.getexportdetailscsv2Controller();
    // exportDetailsCSVController.getexportdetailsController();
    super.initState();
  }

  ExportDetailsCSVController exportDetailsCSVController =
      Get.put(ExportDetailsCSVController());
  ExportDetailsCSV2Controller exportDetailsCSV2Controller =
      Get.put(ExportDetailsCSV2Controller());

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
          title: Text(
            'Export Details',
            style: heading,
          )),
      body: Form(
          child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.0.h,
            ),
            Text(
              'Export Coupon Won',
              style: listStyleappcolor,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Text(
              'From Date*',
              style: profiletext,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Color(0xffD9D9D9).withOpacity(0.1),
              height: 40.00.h, width: 300.00.w,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                controller: fromdate,
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      fromdate.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },

                style: tablestyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.1), width: 1),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Select From date',
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: appbarcolor,
                      size: 20,
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)),
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Text(
              'To Date*',
              style: profiletext,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              color: Color(0xffD9D9D9).withOpacity(0.1),
              height: 40.00.h, width: 300.00.w,
              // padding: const EdgeInsets.only(
              //   left: 20,
              //   right: 20,
              // ),
              child: TextFormField(
                //controller: profileController.firstname,
                controller: todate,
                readOnly:
                    true, //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(
                          2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      todate.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },

                style: tablestyle,
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: const BorderSide(color: appcolor, width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0.1), width: 1),
                    ),
                    fillColor: const Color(0xffC6C6C6),
                    hintText: 'Select to date',
                    prefixIcon: Icon(
                      Icons.calendar_month,
                      color: appbarcolor,
                      size: 20,
                    ),
                    contentPadding: const EdgeInsets.only(left: 20),
                    hintStyle: GoogleFonts.jost(
                        textStyle: TextStyle(
                            fontSize: 10.00.sp,
                            color: formhintcolor,
                            fontWeight: FontWeight.w500)),
                    border: const OutlineInputBorder(
                      gapPadding: 4,
                    )),
              ),
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  setState(() {
                    exportDetailsCSVController
                        .getexportdetailsController(
                            fromdate: fromdate.text, todate: todate.text)
                        .then((value) => setState(() {
                              FileDownloader.downloadFile(
                                  url: exportDetailsCSVController
                                      .listData[0].data[0].filename
                                      .trim(),
                                  onProgress: (name, progress) {
                                    setState(() {
                                      _progress = progress;
                                    });
                                  },
                                  onDownloadCompleted: (value) {
                                    print('path  $value ');
                                    Fluttertoast.showToast(
                                        msg: 'file download');
                                    setState(() {
                                      _progress = null;
                                    });
                                  });
                            }));
                  });
                },
                child: Container(
                  height: 40.0.h,
                  width: 130.0.w,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Export',
                        style: heading,
                      ),
                      Image.asset(
                        'assets/images/share.png',
                        height: 20.0.h,
                      ),
                      Image.asset(
                        'assets/images/downloads.png',
                        height: 20.0.h,
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: appbarcolor),
                ),
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
            SizedBox(
              height: 15.0.h,
            ),
            Text(
              'Export Coupon Data',
              style: listStyleappcolor,
            ),
            SizedBox(
              height: 30.0.h,
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  setState(() {
                    print('clickk');
                    exportDetailsCSV2Controller
                        .getexportdetailscsv2Controller()
                        .then((value) => setState(() {
                              exportDetailsCSV2Controller
                                      .isexportcsvLoading.value
                                  ? CircularProgressIndicator()
                                  : exportDetailsCSV2Controller.listData.isEmpty
                                      ? Text('No data Found')
                                      : FileDownloader.downloadFile(
                                          url: exportDetailsCSV2Controller
                                              .listData[0].data[0].filename
                                              .trim(),
                                          onProgress: (name, progress) {
                                            setState(() {
                                              _progress1 = progress;
                                            });
                                          },
                                          onDownloadCompleted: (value) {
                                            print('path  $value ');
                                            Fluttertoast.showToast(
                                                msg: 'file download');
                                            setState(() {
                                              _progress1 = null;
                                            });
                                          });
                            }));
                  });
                },
                child: Container(
                  height: 40.0.h,
                  width: 130.0.w,
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Export',
                        style: heading,
                      ),
                      Image.asset(
                        'assets/images/share.png',
                        height: 20.0.h,
                      ),
                      Image.asset(
                        'assets/images/downloads.png',
                        height: 20.0.h,
                      )
                    ],
                  )),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber[700]),
                ),
              ),
            ),
            SizedBox(
              height: 20.0.h,
            ),
          ],
        ),
      )),
    );
  }
}
