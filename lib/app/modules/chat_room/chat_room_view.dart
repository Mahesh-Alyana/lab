import 'package:dump/app/global_widget/image_tile.dart';
import 'package:dump/app/global_widget/is_admin_widget.dart';
import 'package:dump/app/global_widget/own_message_card.dart';
import 'package:dump/app/global_widget/reply_message_card.dart';
import 'package:dump/app/modules/chat_room/chat_room_controller.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomView extends StatelessWidget {
  const ChatRoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRoomController>(builder: (logic) {
      return WillPopScope(
        onWillPop: () {
          logic.emitUnSubscribeEvents(logic.conversation.chatRoomId);
          logic.homeController.getRecentChatDetails();
          logic.homeController.markRoomMessageRead(logic.conversation.chatRoomId);
          Get.back();
          return Future.value(false);
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/whatsapp_Back.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            DefaultTabController(
              length: 2,
              initialIndex: 0,
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(85),
                  child: AppBar(
                    backgroundColor: ColorsValue.darkBlue,
                    leadingWidth: 80,
                    bottom: logic.upperTab,
                    titleSpacing: 0,
                    centerTitle: false,
                    leading: InkWell(
                      onTap: () async {
                        logic.emitUnSubscribeEvents(logic.conversation.chatRoomId);
                        logic.homeController.getRecentChatDetails();
                        logic.homeController.markRoomMessageRead(logic.conversation.chatRoomId);
                        Get.back();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            CupertinoIcons.back,
                            size: 24,
                          ),
                          Dimens.boxWidth5,
                          CircleAvatar(
                            child: Text(
                              logic.conversation.roomName[0],
                              style: Styles.blackBold18,
                            ),
                            radius: 20,
                            backgroundColor: Colors.blueGrey,
                          ),
                        ],
                      ),
                    ),
                    title: InkWell(
                      onTap: () {
                        RoutesManagement.goToChatRoomDetails(logic.roomMessageResponse!,logic.conversation);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '  ${logic.conversation.roomName}',
                                  style: const TextStyle(
                                    fontSize: 18.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "   created at ${logic.conversation.createdAt.substring(0,10)}",
                                  style: const TextStyle(
                                    fontSize: 13,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            IconButton(icon: const Icon(CupertinoIcons.refresh),
                              onPressed: () async {
                                await logic.getRecentFileDetails(
                                    logic.conversation.chatRoomId);
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Expanded(
                            // height: MediaQuery.of(context).size.height - 150,
                            child: logic.messageList.isEmpty
                                ? Column(
                                    children: List.generate(
                                        1,
                                        (index) => Padding(
                                              padding: const EdgeInsets.all(10.0),
                                              child: Container(
                                                width: Dimens.hundred,
                                                height: Dimens.fourty,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                    color: Colors.white),
                                                child: Center(
                                                    child: Text(
                                                  'Connecting...',
                                                  style: Styles.black14.copyWith(
                                                      color:
                                                          ColorsValue.darkBlue),
                                                )),
                                              ),
                                            )),
                                  )
                                : RefreshIndicator(
                                    color: ColorsValue.darkBlue,
                                    onRefresh: () async =>
                                        await logic.onRefreshMessage(),
                                    child: ListView.builder(
                                      // reverse: true,
                                      shrinkWrap: true,
                                      controller: logic.scrollController,
                                      itemCount: logic.messageList.length + 1,
                                      itemBuilder: (context, index) {
                                        if (index == logic.messageList.length) {
                                          return Container(
                                            height: 70,
                                          );
                                        }
                                        if (logic.messageList.reversed
                                                .toList()[index]
                                                .postedByUser
                                                .id !=
                                            logic
                                                .homeController
                                                .getUserDetailsResponse!
                                                .user
                                                .id) {
                                          return ReplyCard(
                                            message: logic.messageList.reversed
                                                .toList()[index]
                                                .message,
                                            type: logic.messageList.reversed
                                                .toList()[index]
                                                .type,
                                            time: logic.messageList.reversed
                                                .toList()[index]
                                                .createdAt
                                                .substring(11, 16),
                                          );
                                        }
                                        // Utility.printDLog(logic.roomMessageResponse!.conversation[index].message);
                                        return InkWell(
                                          onLongPress: (){
                                            logic.deleteMessageDialog(logic.messageList.reversed
                                                .toList()[index]);
                                          },
                                          child: OwnMessageCard(
                                            message: logic.messageList.reversed
                                                .toList()[index]
                                                .message,
                                            type: logic.messageList.reversed
                                                .toList()[index]
                                                .type,
                                            time: logic.messageList.reversed
                                                .toList()[index]
                                                .createdAt
                                                .substring(11, 16),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                          ),
                          IsAdminWidget(
                            isAdminWidgetOnly: false,
                            bothAdminAndTrainer: true,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10, left: 5),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  height: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width -
                                                    60,
                                            child: Card(
                                              margin: const EdgeInsets.only(
                                                  left: 2, right: 2, bottom: 8),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              child: TextFormField(
                                                controller: logic.message,
                                                // focusNode: focusNode,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: 2,
                                                minLines: 1,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    logic.updateSendButton(true);
                                                  } else {
                                                    logic.updateSendButton(false);
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: "Type a message",
                                                  hintStyle: const TextStyle(
                                                      color: Colors.grey),
                                                  prefixIcon: IconButton(
                                                    icon: const Icon(
                                                      Icons.keyboard,
                                                      color: ColorsValue.darkBlue,
                                                    ),
                                                    onPressed: () {
                                                      // if (!show) {
                                                      //   focusNode.unfocus();
                                                      //   focusNode.canRequestFocus = false;
                                                      // }
                                                      // setState(() {
                                                      //   show = !show;
                                                      // });
                                                    },
                                                  ),
                                                  suffixIcon: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.attach_file,
                                                          color:
                                                              ColorsValue.darkBlue,
                                                        ),
                                                        onPressed: () {
                                                          logic.getDocumentFromFiles();
                                                        },
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                          Icons.camera_alt,
                                                          color:
                                                              ColorsValue.darkBlue,
                                                        ),
                                                        onPressed: () {
                                                          logic.getImage();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets.all(5),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              bottom: 8,
                                              right: 2,
                                              left: 2,
                                            ),
                                            child: CircleAvatar(
                                              radius: 25,
                                              backgroundColor:
                                                  ColorsValue.primaryColor,
                                              child: logic.sendingMessage?const CircularProgressIndicator():IconButton(
                                                icon: const Icon(
                                                  Icons.send,
                                                  // sendButton ? Icons.send : Icons.mic,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  if (logic.sendButton) {
                                                    logic.scrollController
                                                        .animateTo(
                                                            logic
                                                                .scrollController
                                                                .position
                                                                .maxScrollExtent,
                                                            duration:
                                                                const Duration(
                                                                    milliseconds:
                                                                        300),
                                                            curve: Curves.easeOut);
                                                    logic.onSendMessage('text');
                                                    logic.updateSendButton(false);
                                                  }
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // show ? emojiSelect() : Container(),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.transparent,
                      width: Dimens.screenWidth,
                      child: logic.files.isEmpty
                          ? ListView(
                            children: List.generate(
                                1,
                                (index) => Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        width: Dimens.hundred * 2,
                                        height: Dimens.fourty,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Center(
                                            child: Text(
                                          'No files / Connecting...',
                                          style: Styles.black14.copyWith(
                                              color: ColorsValue.darkBlue),
                                        )),
                                      ),
                                    )),
                          )
                          : ListView.builder(
                            shrinkWrap: true,
                            controller: logic.scrollController,
                            itemCount: logic.messageList.length + 1,
                            itemBuilder: (context, index) {
                              if (index == logic.messageList.length) {
                                return Container(
                                  height: 70,
                                );
                              }
                              if(logic.messageList[index].type == 'file'){
                                if (Utility.checkUrlIsImage(
                                    logic.messageList[index].message)) {
                                  return ImageTile(url: logic.messageList[index].message);
                                }
                                if (Utility.checkUrlIsPed(logic.messageList[index].message)) {
                                  var name = logic.messageList[index].message.split('/').last;
                                  return  Card(
                                    child: ListTile(
                                      onTap: (){
                                        RoutesManagement.goToPdfWebView(logic.messageList[index].message);
                                      },
                                      leading: Icon(CupertinoIcons.folder_fill,size: Dimens.fourty,color: ColorsValue.darkBlue,),
                                      title:    Text(
                                        name.split('/').last.length <20
                                            ? name
                                            :'${name.substring(0,19).split('.')[0]}.pdf',
                                        style: Styles.black18,
                                      ),
                                    ),
                                  );
                                }
                              }
                              return const SizedBox();
                            },
                          ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
