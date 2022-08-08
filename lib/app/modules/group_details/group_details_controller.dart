import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/entity/user_details.dart';
import 'package:dump/app/data/model/response/room_message_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/modules/chat_room/chat_room_controller.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:get/get.dart';

class GroupDetailsController extends GetxController{
  CommonService commonService = Get.find();
  RoomMessageResponse roomMessageResponse = Get.arguments[0] as RoomMessageResponse;
  Conversation conversation = Get.arguments[1] as Conversation;

  ChatRoomController chatRoomController = Get.find<ChatRoomController>();

  List<String> userIds = <String>[];

  void addUserIds(String value){
    userIds.add(value);
    update();
  }

  void removeUserIds(String value){
    userIds.remove(value);
    update();
  }

  void removeUserFromGroup(UserDetails user) async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      "userIds": [user.id],
      "roomId": conversation.chatRoomId
    };
    var token = await commonService.readToken() as String;
    await commonService.apiService.removeUserFromRoom(body,token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      Utility.printDLog('$value');
      roomMessageResponse.users.remove(user);
      update();
    });
    Utility.closeDialog();
  }

  Future<void> adduserInGroup() async {
    Utility.showLoadingDialog();
    var body = <String, dynamic>{
      "userIds": userIds,
      "roomId": conversation.chatRoomId
    };
    var token = await commonService.readToken() as String;
    await commonService.apiService.addUsersInRoom(body,token)
    .catchError(Utility.responseErrorHandle).then((value) {
      Utility.printDLog('${value.toJson()}');
    });
    Utility.closeDialog();
  }

  void updatePage(){
    update();
  }
  List<UserDetails> studentSearch = <UserDetails>[];

  void onChangeStudentSearchMail(String value){
    studentSearch.clear();
    for(var i in roomMessageResponse.users){
      if(i.email.contains(value)){
        studentSearch.add(i);
        update();
      }
    }
  }
}