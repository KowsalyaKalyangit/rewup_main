import 'package:flutter/material.dart';
import 'package:rewup/allpackages.dart';

import '../../../controller/email_template/create_emailtemplate_controller.dart';

class EmailTemplateCreate extends StatefulWidget {
  const EmailTemplateCreate({super.key});

  @override
  State<EmailTemplateCreate> createState() => _EmailTemplateCreateState();
}

class _EmailTemplateCreateState extends State<EmailTemplateCreate> {
  @override
  void initState() {
    super.initState();
  }

  CreateEmailTemplateController createEmailTemplateController =
      Get.put(CreateEmailTemplateController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back))),
          title: Text(
            'Create Email Templates',
            style: heading,
          )),
      body: Column(
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
                          borderSide:
                              const BorderSide(color: appcolor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: const Color(0xffC6C6C6).withOpacity(0.5),
                              width: 1),
                        ),
                        fillColor: const Color(0xffC6C6C6),
                        hintText: 'name',
                        contentPadding: const EdgeInsets.only(left: 10),
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
                          borderSide:
                              const BorderSide(color: appcolor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide: BorderSide(
                              color: const Color(0xffC6C6C6).withOpacity(0.5),
                              width: 1),
                        ),
                        fillColor: const Color(0xffC6C6C6),
                        hintText: 'Email Content',
                        contentPadding: const EdgeInsets.only(left: 10),
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

                      await createEmailTemplateController
                          .createEmailTemplateController(context: context);
                    }
                  },
                  bordercolor: appbarcolor,
                  text: 'ADD',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
