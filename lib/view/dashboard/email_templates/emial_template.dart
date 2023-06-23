import 'package:flutter/material.dart';
import 'package:rewup/controller/email_template/create_emailtemplate_controller.dart';
import 'package:rewup/controller/email_template/get_emailtemplate_controller.dart';

import '../../../allpackages.dart';
import 'email_template_create.dart';

class EmailTemplate extends StatefulWidget {
  const EmailTemplate({super.key});

  @override
  State<EmailTemplate> createState() => _EmailTemplateState();
}

class _EmailTemplateState extends State<EmailTemplate> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GetEmailTemplateController getEmailTemplateController =
      Get.put(GetEmailTemplateController());
  CreateEmailTemplateController createEmailTemplateController =
      Get.put(CreateEmailTemplateController());
  @override
  void initState() {
    func();
    super.initState();
  }

  func() async {
    getEmailTemplateController.getEmailTemplateController();
    createEmailTemplateController.createEmailTemplateController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: appbarcolor,
        onPressed: () {
          //Get.to(EmailTemplateCreate());
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('AlertDialog Title'),
              content: const Text('AlertDialog description'),
              actions: [
                Column(
                  children: [
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: 50.00.h, width: 300.00.w,
                            // padding: const EdgeInsets.only(
                            //   left: 20,
                            //   right: 20,
                            // ),
                            child: TextFormField(
                              controller: createEmailTemplateController.name,
                              style: forminputstyle,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: appcolor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xffC6C6C6)
                                            .withOpacity(0.5),
                                        width: 1),
                                  ),
                                  fillColor: const Color(0xffC6C6C6),
                                  hintText: 'name',
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintStyle: formhintstyle,
                                  border: const OutlineInputBorder(
                                    gapPadding: 4,
                                  )),
                            ),
                          ),
                          SizedBox(height: 3.00.h),
                          Container(
                            color: Colors.white,
                            height: 50.00.h, width: 300.00.w,
                            // padding: const EdgeInsets.only(
                            //   left: 20,
                            //   right: 20,
                            // ),
                            child: TextFormField(
                              controller: createEmailTemplateController.content,
                              style: forminputstyle,
                              decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                        color: appcolor, width: 1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                        color: const Color(0xffC6C6C6)
                                            .withOpacity(0.5),
                                        width: 1),
                                  ),
                                  fillColor: const Color(0xffC6C6C6),
                                  hintText: 'Email Content',
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                  hintStyle: formhintstyle,
                                  border: const OutlineInputBorder(
                                    gapPadding: 4,
                                  )),
                            ),
                          ),
                          SizedBox(height: 20.00.h),
                          ButtonIconButton(
                            press: () async {
                              print('clickk');
                              if (formKey.currentState!.validate()) {
                                print('click');
                                getEmailTemplateController.couponLoading(false);
                                await createEmailTemplateController
                                    .createEmailTemplateController(
                                        context: context)
                                    .then((value) {
                                  createEmailTemplateController.name.clear();
                                  createEmailTemplateController.content.clear();
                                  getEmailTemplateController
                                      .getEmailTemplateController();
                                  Get.back();
                                });
                              }
                            },
                            bordercolor: appbarcolor,
                            text: 'ADD',
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: appbarcolor,
          //  / automaticallyImplyLeading: false,
          centerTitle: true,
          leading: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back))),
          title: Text(
            'Email Templates',
            style: heading,
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (getEmailTemplateController.couponLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (getEmailTemplateController.listData.isEmpty) {
                return Center(
                  child: Text('NO DATA FOUND'),
                );
              } else {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40.0.h,
                        width: 500.w,
                        decoration: BoxDecoration(
                            color: Color(0xff423592).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          children: [
                            Container(
                              width: 110.0.w,
                              child: Center(
                                child: Text(
                                  'SN.No',
                                  style: tablestyle,
                                ),
                              ),
                            ),
                            Container(
                              width: 120.0.w,
                              child: Center(
                                child: Text(
                                  'Name',
                                  style: tablestyle,
                                ),
                              ),
                            ),
                            Container(
                              width: 130.0.w,
                              child: Center(
                                child: Text(
                                  'Edit',
                                  style: tablestyle,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 1000.0.h,
                        width: 1000.0.w,
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: getEmailTemplateController
                                .listData[0].data.length,
                            itemBuilder: (context, index) {
                              var couponname = getEmailTemplateController
                                  .listData[0].data[index];
                              return Container(
                                height: 40.0.h,
                                width: 500.w,
                                child: Card(
                                  child: Row(
                                    //  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 50.0.w,
                                      ),
                                      Container(
                                          width: 100.0.w,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: new Text(
                                                  couponname.slNo.toString(),
                                                  style: listtitlecolor,
                                                ),
                                              )
                                            ],
                                          )),
                                      Container(
                                          width: 130.0.w,
                                          child: Row(
                                            children: <Widget>[
                                              Flexible(
                                                child: new Text(
                                                  couponname.name.toString(),
                                                  style: listtitlecolor,
                                                ),
                                              )
                                            ],
                                          )),
                                      InkWell(
                                        onTap: () {
                                          showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text(
                                                  'AlertDialog Title'),
                                              content: const Text(
                                                  'AlertDialog description'),
                                              actions: [
                                                Column(
                                                  children: [
                                                    Form(
                                                      key: formKey,
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            color: Colors.white,
                                                            height: 50.00.h,
                                                            width: 300.00.w,
                                                            // padding: const EdgeInsets.only(
                                                            //   left: 20,
                                                            //   right: 20,
                                                            // ),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  createEmailTemplateController
                                                                      .name,
                                                              style:
                                                                  forminputstyle,
                                                              decoration:
                                                                  InputDecoration(
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                appcolor,
                                                                            width:
                                                                                1),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                const Color(0xffC6C6C6).withOpacity(0.5),
                                                                            width: 1),
                                                                      ),
                                                                      fillColor:
                                                                          const Color(
                                                                              0xffC6C6C6),
                                                                      hintText:
                                                                          'name',
                                                                      contentPadding:
                                                                          const EdgeInsets.only(
                                                                              left:
                                                                                  10),
                                                                      hintStyle:
                                                                          formhintstyle,
                                                                      border:
                                                                          const OutlineInputBorder(
                                                                        gapPadding:
                                                                            4,
                                                                      )),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 3.00.h),
                                                          Container(
                                                            color: Colors.white,
                                                            height: 50.00.h,
                                                            width: 300.00.w,
                                                            // padding: const EdgeInsets.only(
                                                            //   left: 20,
                                                            //   right: 20,
                                                            // ),
                                                            child:
                                                                TextFormField(
                                                              controller:
                                                                  createEmailTemplateController
                                                                      .content,
                                                              style:
                                                                  forminputstyle,
                                                              decoration:
                                                                  InputDecoration(
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: const BorderSide(
                                                                            color:
                                                                                appcolor,
                                                                            width:
                                                                                1),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                const Color(0xffC6C6C6).withOpacity(0.5),
                                                                            width: 1),
                                                                      ),
                                                                      fillColor:
                                                                          const Color(
                                                                              0xffC6C6C6),
                                                                      hintText:
                                                                          'Email Content',
                                                                      contentPadding:
                                                                          const EdgeInsets.only(
                                                                              left:
                                                                                  10),
                                                                      hintStyle:
                                                                          formhintstyle,
                                                                      border:
                                                                          const OutlineInputBorder(
                                                                        gapPadding:
                                                                            4,
                                                                      )),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 20.00.h),
                                                          ButtonIconButton(
                                                            press: () async {
                                                              print('clickk');
                                                              if (formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                print('click');
                                                                getEmailTemplateController
                                                                    .couponLoading(
                                                                        false);
                                                                await createEmailTemplateController
                                                                    .createEmailTemplateController(
                                                                        context:
                                                                            context)
                                                                    .then(
                                                                        (value) {
                                                                  createEmailTemplateController
                                                                      .name
                                                                      .clear();
                                                                  createEmailTemplateController
                                                                      .content
                                                                      .clear();
                                                                  getEmailTemplateController
                                                                      .getEmailTemplateController();
                                                                  Get.back();
                                                                });
                                                              }
                                                            },
                                                            bordercolor:
                                                                appbarcolor,
                                                            text: 'ADD',
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                          width: 30.0.w,
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.grey,
                                            size: 18,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
