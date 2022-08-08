import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/entity/conversation_room.dart';
import 'package:dump/app/data/model/response/delete_group_response.dart';
import 'package:dump/app/data/model/response/delete_message_response.dart';
import 'package:dump/app/data/model/response/get_files_response.dart';
import 'package:dump/app/data/model/response/post_message_response.dart';
import 'package:dump/app/data/model/response/recent_message_response.dart';
import 'package:dump/app/data/model/response/room_message_response.dart';
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ChatRoomController extends GetxController {
  CommonService commonService = Get.find();
  HomeController homeController = Get.find<HomeController>();
  Conversation conversation = Get.arguments as Conversation;
  RoomMessageResponse? roomMessageResponse;
  List<dynamic> files = <dynamic>[];
  List<ConversationRoom> messageList = <ConversationRoom>[];


  int page = 0;

  ScrollController scrollController = ScrollController();

  TextEditingController message = TextEditingController();
  var url =
      'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
  final dio = Dio();

  bool sendButton = false;
  void updateSendButton(bool value) {
    sendButton = value;
    update();
  }

  @override
  void onInit() async {
    connectToServer();
    await getRecentChatDetails(conversation.chatRoomId, page).then((value) {
      homeController.markRoomMessageRead(conversation.chatRoomId);
    });
    await getRecentFileDetails(conversation.chatRoomId);
    super.onInit();
  }

  Future<void> onRefreshMessage() async {
    page += 1;
    var token = await commonService.readToken() as String;
    await getRoomMessage(conversation.chatRoomId, token, page).then((value) {
      if (value.conversation.isEmpty) {
        Utility.showError('You at the end');
      }
      messageList.addAll(value.conversation.reversed.toList());
      update();
    });
  }

  late IO.Socket socket;

  void connectToServer() {
    try {
      socket = IO.io(
          'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com',
          OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
              .build());
      socket.connect();
      var id = homeController.getUserDetailsResponse!.user.id;
      emitIdentityEvents(id);
      emitSubscribeEvents(id, conversation.chatRoomId);
      onMessageEvent();

      Utility.printDLog('${socket.connected}');
      Utility.printDLog('${socket.id}');
    } catch (e) {
      Utility.printDLog(e.toString());
    }
  }

  void onMessageEvent() {
    socket.on('message', (data) => addMessageToChatWindow(data));
  }

  void emitIdentityEvents(String id) async {
    Utility.printDLog('Emit identity events');
    socket.emit('identity', {'userId': id});
  }

  void addMessageToChatWindow(Map<String, dynamic> data) {
    var value = RecentMessageResponse.fromJson(data);
    ConversationRoom conversationRoom = ConversationRoom(
        id: value.post.id,
        chatRoomId: value.post.chatRoomId,
        message: value.post.message,
        type: value.post.type,
        postedByUser: value.post.postedByUser,
        readByRecipients: [],
        createdAt: value.post.createdAt);
    updateChats(conversationRoom);
  }

  void emitSubscribeEvents(String userId, String roomId) async {
    Utility.printDLog('Emit subscribe events');
    socket.emit('subscribe', {'userId': userId, 'room': roomId});
  }

  void emitUnSubscribeEvents(String roomId) async {
    Utility.printDLog('Emit unsubscribe events');
    socket.emit('unsubscribe', {'room': roomId});
  }

  @override
  void dispose() {
    Utility.printDLog('Dispose method called');
    socket.dispose();
    super.dispose();
  }

  void onSendMessage(String type) async {
    if (message.text.isNotEmpty) {
      Utility.printDLog(message.text);
      var body = <String, String>{"message": message.text, "type": type};
      Utility.printDLog('$body');
      await postMessageToRoom(conversation.chatRoomId, body).whenComplete(() {
        message.clear();
      });
    }
  }

  bool sendingMessage = false;

  void updateSendingMessage(bool value){
    sendingMessage = value;
    update();
  }

  Future<void> postMessageToRoom(String id, Map<String, String> body) async {
    updateSendingMessage(true);
    var token = await commonService.readToken() as String;
    await postMessage(body, token, id)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      updateSendingMessage(false);
    });
    updateSendingMessage(false);
  }

  void updateChats(ConversationRoom conversation) {
    messageList.insert(0, conversation);
    update();
  }

  Future<void> getRecentFileDetails(String id) async {
    files.clear();
    update();
    await getRoomFileDetails(id)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      Utility.printDLog('$value');
      files = value.files;
      update();
    });
  }

  Future<void> getRecentChatDetails(String id, int page) async {
    var token = await commonService.readToken() as String;
    await getRoomMessage(id, token, page)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      roomMessageResponse = value;
      messageList = value.conversation.reversed.toList();
      update();
    });
  }

  void deleteMessageDialog(ConversationRoom conversationRoom){
    Get.defaultDialog(
      textConfirm: 'Delete',
      textCancel: 'Undo',
      middleText: 'Are you sure want to delete this message',
      onConfirm: () async {
        await deleteMessageById(conversationRoom).then((value){
          Get.back();
        });
      },
      onCancel: (){
        Get.back();
    }
    );
  }


  Future<void> deleteMessageById(ConversationRoom conversationRoom) async {

    Utility.printDLog('Delete message');
    var token = await commonService.readToken() as String;
    await deleteMessage(conversationRoom.id, token,)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
          messageList.remove(conversationRoom);
      update();
    });
  }
  Future<void> deleteGroupById(String id,) async {
    Utility.showLoadingDialog();
    var token = await commonService.readToken() as String;
    await deleteGroup(id, token)
        .catchError(Utility.responseErrorHandle)
        .then((value) {
      update();
    });
    Utility.closeDialog();
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

  Future<RoomMessageResponse> getRoomMessage(id, token, page) async {
    var url =
        'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
    final dio = Dio();
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<RoomMessageResponse>(Options(
            method: 'GET', headers: _headers, extra: _extra)
            .compose(dio.options, '/room/$id?page=$page&limit=10', data: _data)
            .copyWith(baseUrl: url)));
    final value = RoomMessageResponse.fromJson(_result.data!);
    return value;
  }
  Future<DeleteGroupResponse> deleteGroup(id, token) async {
    var url =
        'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
    final dio = Dio();
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<RoomMessageResponse>(Options(
            method: 'DELETE', headers: _headers, extra: _extra)
            .compose(dio.options, '/delete/room/$id', data: _data)
            .copyWith(baseUrl: url)));
    final value = DeleteGroupResponse.fromJson(_result.data!);
    return value;
  }

  Future<DeleteMessageResponse> deleteMessage(id, token) async {
    var url =
        'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1';
    final dio = Dio();
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<RoomMessageResponse>(Options(
                method: 'DELETE', headers: _headers, extra: _extra)
            .compose(dio.options, '/delete/message/$id', data: _data)
            .copyWith(baseUrl: url)));
    final value = DeleteMessageResponse.fromJson(_result.data!);
    return value;
  }

  Future<GetFilesResponse> getRoomFileDetails(id,) async {
    var url = 'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:8080';
    final dio = Dio();
    const _extra = <String, dynamic>{};
    final _headers = {};///<String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await dio.fetch<Map<String, dynamic>>(
        setStreamType<RoomMessageResponse>(Options(
            method: 'GET', extra: _extra)
            .compose(dio.options, '/files/$id', data: _data)
            .copyWith(baseUrl: url)));
    final value = GetFilesResponse.fromJson(_result.data!);
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

  final upperTab = TabBar(
      isScrollable: false,
      indicatorColor: ColorsValue.primaryColor,
      // labelStyle: Styles.white16.copyWith(height: 5),
      labelPadding: const EdgeInsets.all(5),
      tabs: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Chat',
            style: Styles.white16,
          )),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            'Files',
            style: Styles.white16,
          )),
        )
      ]);

  ///================================== Send image related things =================================

  String imagePath = '';

  void getImage() {
    Utility.printDLog('Get image function called');
    Get.bottomSheet<void>(
      ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          ListTile(
            leading: const Icon(
              Icons.image,
            ),
            title: Text(
              'gallery',
              style: Styles.black18,
            ),
            onTap: () {
              getImageFromGallery();
              Utility.closeBottomSheet();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.camera,
            ),
            title: Text(
              'camera',
              style: Styles.black18,
            ),
            onTap: () {
              getImageFromCameraSend();
              Utility.closeBottomSheet();
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
    );
  }
  void getImageFromCameraSend() async {
    await commonService.getImagePathFromCamera().then((value) {
      if(value.isNotEmpty){
        imagePath = value;
        update();
        RoutesManagement.goToPreViewImageAndSend();
      }
    });
  }
  void getImageFromGallery() async {
    await commonService.getImagePathFromGallery().then((value) {
      if(value.isNotEmpty){
        imagePath = value;
        update();
        RoutesManagement.goToPreViewImageAndSend();
      }else{
        Utility.showError('Something went wrong');
      }
    });
  }
  void getDocumentFromFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      File file = File(result.files.single.path!);
      var path = file.path;
      if(Utility.checkUrlIsPed(path)){
        imagePath = path;
        update();
        RoutesManagement.goToPreViewImageAndSend();
      }else{
        Utility.showError('File format not support. Only PDF ');
      }
    } else {
      Utility.showError('Error in picking file');
    }
  }
  void sendImageMessage(String path){
    Utility.showLoadingDialog();
    commonService
        .uploadImage(path, conversation.chatRoomId)
        .then((value) async {
      var body = <String, String>{
        "message":
        'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:8080/files/download/${conversation.chatRoomId}/$value',
        "type": 'file'
      };
      await postMessageToRoom(conversation.chatRoomId, body);
    });
    Utility.closeDialog();
    Get.back();
  }

}
