import 'dart:io';

import 'package:dump/app/data/model/entity/collage.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AddCollageNameController extends GetxController {
  CommonService commonService = Get.find();

  List<Collage> collageList = <Collage>[];

  List<String> collages = <String>[];
  void addCollage(String value) {
    collages.add(value);
    update();
  }

  void removeCollage(String value) {
    collages.remove(value);
    update();
  }

  String collageName = '';

  void onChangeCollageName(String value) {
    collageName = value;
    update();
  }

  void onClickAddCollage() async {
    if (collageName.isEmpty) {
      Utility.showError('Enter correct collageName address');
    } else {
      await addCollageName([collageName]);
    }
  }

  void addCollageNameByExcel() async {
    collages.clear();
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      var path = file.path;
      if (path.split('.').last == 'xlsx') {
        var file = path;
        var bytes = File(file).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            collages.add('${row[0]!.value!}');
          }
        }
        Utility.printDLog('$collages');
        if (collages.isNotEmpty) {
          RoutesManagement.goToAddCollageNameFromExcel();
        } else {
          Utility.showError('No Collage Name found in excel sheet');
        }
      } else {
        Utility.showError('Please select xlsx file');
      }
    } else {
      Utility.showError('Error in picking file');
    }
  }

  Future<void> deleteCollageNameById(String id) async {
    Utility.showLoadingDialog();
    await commonService.apiService
        .deleteCollage({"_id": id})
        .catchError(Utility.responseErrorHandle)
        .then((value) async {
          await getCollageName();
        });
    Utility.closeDialog();
  }

  Future<void> getCollageName() async {
    await commonService.apiService
        .getAllCollage()
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      collageList = value.collages;
      update();
    });
  }

  Future<void> addCollageName(List<String> collages) async {
    collageName = '';
    update();
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      'collagesList': collages,
    };
    await commonService.apiService.addCollageByList(body)
        .catchError(Utility.responseErrorHandle)
        .then((value) async {
      await getCollageName();
    });
    Utility.closeDialog();
  }

  @override
  void onInit() async {
    await getCollageName();
    super.onInit();
  }
}
