// ignore_for_file: invalid_return_type_for_catch_error

import 'package:dump/app/data/model/response/get_user_details_response.dart';
import 'package:dump/app/data/model/response/login_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:get/get.dart';

class LandingController extends GetxController{
  CommonService commonService = Get.find();


  String email = '';
  String password = '';

  GetUserDetailsResponse? getUserDetailsResponse;

  void onChangedEmail(String value){
    email = value;
    update();
  }

  void onChangedPassword(String value){
    password = value;
    update();
  }

  void onClickLoginButton() async {
    if(email.isEmpty || !email.contains('@gmail.com')){
      Utility.showError('Enter correct gmail');
    }
    else if(password.isEmpty){
      Utility.showError('Enter password');
    }
    else{
      Utility.printDLog('$email, $password');
      await login().then((value)async {

        Utility.printDLog('${value.toJson()}');
        update();
        if(value.user.firstName.isEmpty || value.user.lastName.isEmpty || value.user.college.isEmpty || value.user.mobile.isEmpty){
          RoutesManagement.goToUpdateProfileView(value);
        }else{
            await commonService.writeToken(value.authorization);
            RoutesManagement.goToHomeView();

        }
      });
    }
  }

  LoginResponse? loginResponse;

  Future<LoginResponse> login() async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      'email': email,
      'password': password
    };
    await commonService.apiService
        .login(body)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
          loginResponse = value;
          Utility.closeDialog();
    });
    return loginResponse!;
  }

  Future<void> checkProfile() async {
    Utility.showLoadingDialog();
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .getUserDetails(token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
          getUserDetailsResponse = value;
          Utility.printDLog('${value.toJson()}');
          update();
          if(value.user.firstName.isEmpty || value.user.lastName.isEmpty || value.user.college.isEmpty || value.user.mobile.isEmpty){

          }else{
            RoutesManagement.goToHomeView();
          }
      // Utility.closeDialog();
    });
  }

}