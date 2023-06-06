import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:rewup/model/exportdetails_csv_model.dart';

import '../model/exportcsv_modeol.dart';
import '../service/exporty_csv_service.dart';

class ExportDetailsCSVController extends GetxController {
  // RxList<DetailsModel> _listData = <DetailsModel>[].obs;
  var _listData = <ExportCsvModel>[];
  List<ExportCsvModel> get listData => _listData;
  RxBool isexportLoading = true.obs;
  Map map = {};
  Future getexportdetailsController({fromdate, todate}) async {
    isexportLoading(true);
    try {
      _listData.clear();
      var data = await ExportcsvService()
          .getExportcsvService(fromdate: fromdate, todate: todate);
      if (data != null) {
        _listData.add(data);

        isexportLoading(false);
      } else {
        Fluttertoast.showToast(msg: 'Data not Found');
        isexportLoading(false);
        Get.back();
      }
    } catch (e) {
      rethrow;
    }
  }
}
