import 'package:dump/app/modules/chat_room/chat_room_controller.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomDetails extends StatelessWidget {
  const ChatRoomDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRoomController>(
      builder: (logic) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text('Accenture',style: Styles.black18,),
            leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  CupertinoIcons.clear_thick,
                  size: Dimens.twentyFive,
                  color: ColorsValue.darkBlue,
                )),
          ),

          body: Column(
              children: List.generate(
                  logic.roomMessageResponse!.users.length,
                      (index) =>
                      StudentProfileTile(
                          color:Colors.white,
                          userDetails: logic.roomMessageResponse!.users[index])))
        );
      }
    );
  }
}
