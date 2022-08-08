import 'package:dump/app/data/model/entity/collage.dart';
import 'package:dump/app/data/model/response/login_response.dart';
import 'package:dump/app/data/model/response/update_user_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileController extends GetxController{
  LoginResponse loginResponse = Get.arguments;
  CommonService commonService = Get.find();
  UpdateUserResponse? updateUserResponse;

  String firstName = '';
  String lastName = '';
  String mobile = '';
  String collage = '';
  String password = '';
  String confirmPassword = '';
  List<Collage> collageList = <Collage>[];

  void onChangedFirstName(String value){
    firstName = value;
    update();
  }

  void onChangedLastName(String value){
    lastName = value;
    update();
  }

  void onChangedMobile(String value){
    mobile = value;
    update();
  }

  void onChangedCollage(String value){
    collage = value;
    update();
  }

  void onChangedPassword(String value){
    password = value;
    update();
  }

  void onChangedConfirmPassword(String value){
    confirmPassword = value;
    update();
  }


  void onClickUpdateProfile() async {
    if(firstName.isEmpty){
      Utility.showError('Enter your first name');
    }else if(lastName.isEmpty){
      Utility.showError('Enter your last name');
    }else if(mobile.isEmpty || mobile.length != 10){
      Utility.showError('Enter correct mobile number');
    }else if(collage.isEmpty){
      Utility.showError('Enter your collage name');
    }else if(password.isEmpty){
      Utility.showError('Enter password');
    }else if(confirmPassword.isEmpty){
      Utility.showError('Enter confirm password');
    }else if(password != confirmPassword){
      Utility.showError("Password and confirm doesn't match");
    }else{
      await updateUserDetails().then((value) async {
        await commonService.writeToken(loginResponse.authorization);
        RoutesManagement.goToHomeView();
      });
    }

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


  Future<UpdateUserResponse> updateUserDetails() async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
      'mobile':mobile,
      'college':collage,
      'password':password
    };
    await commonService.apiService
        .updateUser(body,'Bearer ${loginResponse.authorization}')
        .catchError(Utility.responseErrorHandle)
        .then((value) {
          updateUserResponse = value;
          update();
      Utility.closeDialog();
    });
    return updateUserResponse!;
  }


  void collegeBottomSheet() async {
   Get.bottomSheet(Container(
     child: ListView(
       children: List.generate(collageList.length, (index) =>
         Card(
           child: ListTile(
             onTap: (){
               Get.back();
               collage = collageList[index].name;
               update();
             },
             title: Text(collageList[index].name,style: Styles.black18,),
           ),
         ),
      ),
     ),
   ));
  }

  @override
  void onInit() async{
    await getCollageName();
    super.onInit();
  }
}