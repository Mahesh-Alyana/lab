import 'dart:core';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dump/app/data/model/entity/collage.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:dump/app/data/model/response/add_collage_response.dart';
import 'package:dump/app/data/model/response/get_all_users_details_response.dart';
import 'package:dump/app/data/model/response/get_user_details_response.dart';
import 'package:dump/app/data/model/response/mark_message_read_response.dart';
import 'package:dump/app/data/model/response/recent_conversation_response.dart';
import 'package:dump/app/data/model/response/update_user_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:excel/excel.dart';

class HomeController extends GetxController {
  CommonService commonService = Get.find();

  GetAllUserDetailsResponse? getAllUserDetailsResponse;
  RecentConversationResponse? recentConversationResponse;
  GetUserDetailsResponse? getUserDetailsResponse;
  int currentIndex = 0;

  List<UserDetails> allUsers = <UserDetails>[];
  List<UserDetails> students = <UserDetails>[];
  List<UserDetails> teachers = <UserDetails>[];

  List<Collage> collageList = <Collage>[];

  void changeCurrentIndex(int index) {
    currentIndex = index;
    update();
  }

  Future<void> getUserDetail() async {
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .getUserDetails(token)
        .catchError((value) async {
      Utility.responseErrorHandle(value);
      await commonService.box.remove('token');
      RoutesManagement.goToLoginView();
    }).then((value) {
      getUserDetailsResponse = value;
      update();
    });
  }

  Future<void> getAllUsersDetails() async {
    students.clear();
    teachers.clear();
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .getAllUsersDetails(token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      // Utility.printDLog('All users details ${value.toJson()}');
      getAllUserDetailsResponse = value;
      allUsers = value.users;
      for (var i in value.users) {
        if (i.type == 'student') {
          students.add(i);
        }
        if (i.type == 'trainer') {
          teachers.add(i);
        }
      }
      // Utility.printDLog('${value.users.length} ${students.length} ${teachers.length}');
      update();
    });
  }

  ///#######################################################[Search student or teacher]###########################################################
  List<UserDetails> studentSearch = <UserDetails>[];

  void onChangeStudentSearchMail(String value) {
    studentSearch.clear();
    for (var i in students) {
      if (i.email.contains(value)) {
        studentSearch.add(i);
        update();
      }
    }
  }

  List<UserDetails> teacherSearch = <UserDetails>[];

  void onChangeTeacherSearchMail(String value) {
    studentSearch.clear();
    for (var i in teachers) {
      if (i.email.contains(value)) {
        teacherSearch.add(i);
        update();
      }
    }
  }

  ///##################################################################################################################
  Future<void> getRecentChatDetails() async {
    recentConversationResponse == null;
    update();
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .getRecentChatDetails(token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      recentConversationResponse = value;
      Utility.printDLog('Recent chat details ${value.toJson()}');
      update();
    });
  }

  void markRoomMessageRead(id) async {
    var token = await commonService.readToken() as String;
    await markMessageReadByRoomId(
      token,
      id,
    )
        // .catchError(Utility.responseErrorHandle)
        .then((value) {
      // Utility.printDLog('All users details ${value.toJson()}');
      update();
    });
  }

  void showAddUserBottomSheet() {
    Get.bottomSheet(Container(
      height: Dimens.hundred * 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
                onTap: () {
                  Utility.closeBottomSheet();
                  createStudentByExcel();
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                title: Text(
                  'Import Gmail From Excel',
                  style: Styles.black18,
                )),
            ListTile(
                onTap: () {
                  Get.back();
                  RoutesManagement.goToAddStudentView('student', []);
                  // RoutesManagement.goToAddParticipants();
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                title: Text(
                  'Add User',
                  style: Styles.black18,
                )),
            Dimens.boxHeight10,
            PrimaryButton(
              onPress: () {
                Get.back();
              },
              text: 'Cancel',
            )
          ],
        ),
      ),
    ));
  }

  Future<void> deleteUserById(String id) async {
    Utility.showLoadingDialog();
    await commonService.apiService
        .deleteUser({"_id": id})
        .catchError(Utility.responseErrorHandle)
        .then((value) async {
          await getAllUsersDetails();
          update();
          Utility.showError(value.message);
        });
    Utility.closeDialog();
  }

  @override
  void onInit() async {
    await getUserDetail();
    await getAllUsersDetails();
    await getRecentChatDetails();
    super.onInit();
  }

  Future<MarkMessageReadResponse> markMessageReadByRoomId(token, id) async {
    var url =
        'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
    final dio = Dio();
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    // _data.addAll(body);
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<MarkMessageReadResponse>(
            Options(method: 'PUT', headers: _headers, extra: _extra)
                .compose(dio.options, '/room/$id/mark-read',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: url)));
    final value = MarkMessageReadResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  void createStudentByExcel() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      var path = file.path;
      if (path.split('.').last == 'xlsx') {
        var file = path;
        var bytes = File(file).readAsBytesSync();
        var excel = Excel.decodeBytes(bytes);
        var userGmail = <String>[];
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            if ('${row[0]!.value!}'.contains('@gmail.com')) {
              userGmail.add('${row[0]!.value!}');
            }
          }
        }
        Utility.printDLog('$userGmail');
        if (userGmail.isNotEmpty) {
          RoutesManagement.goToAddStudentFromExcel('student', userGmail);
        } else {
          Utility.showError('No gmail found in excel sheet');
        }
      } else {
        Utility.showError('Please select xlsx file');
      }
    } else {
      Utility.showError('Error in picking file');
    }
  }

  ///################################################[Reset Password]##################################################################

  String password = '';
  String confirmPassword = '';

  void onChangedPassword(String value) {
    password = value;
    update();
  }

  void onChangedConfirmPassword(String value) {
    confirmPassword = value;
    update();
  }
  void onClickResetButton() async {
    if(password.isNotEmpty){
      await updateUserDetails();
    }else{
      Utility.showError("Password and confirm password doesn't match");
    }
  }

  Future<void> updateUserDetails() async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      'firstName': getUserDetailsResponse!.user.firstName,
      'lastName': getUserDetailsResponse!.user.lastName,
      'mobile': getUserDetailsResponse!.user.mobile,
      'college': getUserDetailsResponse!.user.college,
      'password': password
    };
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .updateUser(body, token)
        .catchError(Utility.responseErrorHandle);
    Utility.closeDialog();
    Get.back();
    Utility.showError('Password reset successfully');
  }
}
