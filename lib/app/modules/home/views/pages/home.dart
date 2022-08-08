import 'package:dump/app/global_widget/is_admin_widget.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/local_widget/room_chat_tile.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder: (logic) {
        return RefreshIndicator(
          color: ColorsValue.darkBlue,
          onRefresh:  () async => await logic.getRecentChatDetails(),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              actions: [
                IsAdminWidget(
                  isAdminWidgetOnly: false,
                  bothAdminAndTrainer: true,
                  child: IconButton(
                      onPressed: () {
                        RoutesManagement.goToCreateGroupView();
                      },
                      icon: Icon(
                        CupertinoIcons.add,
                        color: ColorsValue.darkBlue,
                        size: Dimens.twentyFive,
                      )),
                )
              ],
              leading: Icon(
                CupertinoIcons.chat_bubble_text_fill,
                size: Dimens.twentyFive,
                color: ColorsValue.primaryColor,
              ),
              title: Text(
                logic.recentConversationResponse == null
                    ? 'Connecting...'
                    : 'Rooms',
                style: Styles.black18.copyWith(color: ColorsValue.darkBlue),
              ),
            ),
            body: logic.recentConversationResponse == null
                ? SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.screenHeight,
                    child: Center(
                        child: Text(
                      'Np Chats',
                      style: Styles.blackBold18,
                    )),
                  )
                : ListView(children: List.generate(logic.recentConversationResponse!.conversation.length, (index) =>  RoomChatTile(conversation: logic.recentConversationResponse!.conversation[index],))),
          ),
        );
      });
}
