import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rewup/allpackages.dart';
import 'package:rewup/service/email_templates/create_emailtemplates_service.dart';

import 'package:rewup/service/email_templates/getemail_template_service.dart';

import '../../model/get_emailtemplate/create_email_template_model.dart';
import '../../model/get_emailtemplate/getemail_template_model.dart';
import '../login_controller.dart';

class CreateEmailTemplateController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <CreateemailTemplateModel>[];
  List<CreateemailTemplateModel> get listData => _listData;
  RxBool couponLoading = true.obs;
  TextEditingController name = TextEditingController();
  TextEditingController content = TextEditingController();
  Future createEmailTemplateController({
    context,
  }) async {
    couponLoading(true);

    couponLoading(true);
    if (couponLoading.value) {
      _loadingBar(context);
    }
    try {
      var data = await CreateEmailTemplatesService()
          .createEmailTemplatesService(
              dashboard: "addemailtemplate",
              name: name.text,
              description: content.text);
      if (data != null) {
        _listData.clear();
        _listData.add(data);

        couponLoading(false);
        Get.back();
      } else {
        couponLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }

  void _loadingBar(BuildContext ctx) {
    showDialog(
        barrierDismissible: false,
        context: ctx,
        builder: (BuildContext context) {
          return const Center(
            child: Loader(),
          );
        });
  }
}
