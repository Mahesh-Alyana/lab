import 'dart:math';

import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:get/get.dart';

class AddStudentController extends GetxController {
  CommonService commonService = Get.find();

  String type = Get.arguments[0] as String;

  List<String> gmail = Get.arguments[1] as List<String>;

  void addGmail(String value){
    gmail.add(value);
    update();
  }

  void removeGmail(String value){
    gmail.remove(value);
    update();
  }

  String email = '';

  void onChangedEmail(String value) {
    email = value;
    update();
  }

  void onClickCreateUser() async {
    if (email.isEmpty || !email.isEmail) {
      Utility.showError('Enter correct email address');
    } else {
      await createUser();
    }
  }

  final String _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> createUser() async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      'email': email,
      'password': getRandomString(5),
      'type': type
    };
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .createUser(body, token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      Utility.printDLog('${value.toJson()}');
      Utility.closeDialog();
      Get.back();
      Utility.showError(value.message);
    });
  }

  Future<void> createUserFromList() async {
    if(gmail.isNotEmpty){
      var body = <String, dynamic>{
        "userLists": gmail,
        "type":"student"
      };
      Utility.showLoadingDialog();
      await commonService.apiService
          .createUsersByList(body)
          .catchError(Utility.responseErrorHandle)
          .then((value) {
        Utility.printDLog('${value.toJson()}');
        Utility.closeDialog();
        Get.back();
      });
    }else{
      Utility.showError('No Gmail found');
    }

  }
}
