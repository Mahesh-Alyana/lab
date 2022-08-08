import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:dump/app/data/model/response/post_message_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateGroupController extends GetxController {
  String groupName = '';
  CommonService commonService = Get.find();
  HomeController home = Get.find();
  List<String> userIds = <String>[];
  List<UserDetails> members = <UserDetails>[];

  var url =
      'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
  final dio = Dio();

  void onChangedGroupName(String value) {
    groupName = value;
    update();
  }

  void addMember(UserDetails value) {
    members.add(value);
    update();
  }

  void removeMember(UserDetails value) {
    members.remove(value);
    update();
  }

  void addMemberId(String value) {
    userIds.add(value);
    update();
  }

  void removeMemberId(String value) {
    userIds.remove(value);
    update();
  }

  void doNothing(BuildContext context) {}

  void showAddParticipantBottomSheet() {
    Get.bottomSheet(Container(
      height: Dimens.hundred * 2,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                 await addStudentByExcel();
              },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                title: Text(
                  'Import From Excel',
                  style: Styles.black18,
                )),
            ListTile(
                onTap: () {
                  Get.back();
                  RoutesManagement.goToAddParticipants();
                },
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                  size: 16,
                ),
                title: Text(
                  'Add Participants',
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

  Future<void> addStudentByExcel() async {
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
        for(var i in userGmail){
          for(var j in home.allUsers){
            if(j.email == i){
              addMemberId(j.id);
              addMember(j);
            }
          }
          update();
        }
        Utility.printDLog('$userGmail');
      } else {
        Utility.showError('Please select xlsx file');
      }
    } else {
      Utility.showError('Error in picking file');
    }
  }

  void createGroup() async {
    if (groupName.isEmpty) {
      Utility.showError('Enter group name');
    } else if (members.isEmpty) {
      Utility.showError('Add participants');
    } else {
      Utility.printDLog('Create group $groupName $members $userIds');
      await createRoom(groupName, userIds);
    }
  }

  Future<void> createRoom(String name, List<String> usersId) async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      "userIds": userIds,
      "type": "trainer-to-reader",
      "roomName": name
    };
    var token = await commonService.readToken() as String;
    await commonService.apiService
        .createRoom(body, token)
        .catchError(Utility.responseErrorHandle)
        .then((value) async {
      await postMessageToRoom(value.chatRoom['chatRoomId']).whenComplete(() {
        Utility.closeDialog();
        Get.back();
        Utility.showError('Room created successfully');
      });
    });
    Utility.closeDialog();
  }

  Future<void> postMessageToRoom(
    String id,
  ) async {
    var body = <String, String>{
      "message": 'creating a new chatroom',
      "type": 'text'
    };
    var token = await commonService.readToken() as String;
    await postMessage(body, token, id)
        .catchError(Utility.responseErrorHandle)
        .then((value) async {
      await Get.find<HomeController>().getRecentChatDetails();
    });
  }

  Future<PostMessageResponse> postMessage(body, token, id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    _data.addAll(body);
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<PostMessageResponse>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(dio.options, '/room/$id/message',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: url)));
    final value = PostMessageResponse.fromJson(_result.data!);
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

  void addUserByExcelSheet() {}


  ///#######################################################[Search student or teacher]###########################################################
  List<UserDetails> studentSearch = <UserDetails>[];

  void onChangeStudentSearchMail(String value){
    studentSearch.clear();
    for(var i in home.allUsers){
      if(i.email.contains(value)){
        studentSearch.add(i);
        update();
      }
    }
  }

  String search = '';
  List<UserDetails> userSearch = <UserDetails>[];

  void onChangeUserSearchMail(String value){
    userSearch.clear();
    for(var i in home.allUsers){
      if(i.email.contains(value)){
        userSearch.add(i);
        search = value;
        update();
      }
    }
  }
}
