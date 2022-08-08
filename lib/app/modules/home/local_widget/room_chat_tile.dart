import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomChatTile extends StatelessWidget {
  const RoomChatTile({Key? key, required this.conversation}) : super(key: key);
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => RoutesManagement.goToChatRoomView(conversation),
      child: Container(
        margin: EdgeInsets.only(top: Dimens.five),
        height: Dimens.seventy,
        width: Dimens.screenWidth,
        child: Row(
          children: [
            SizedBox(
              height: Dimens.seventy,
              width: Dimens.seventy,
              child: Center(
                child: CircleAvatar(
                    radius: Dimens.thirty,
                    backgroundColor: ColorsValue.darkBlue,
                    child: Text(
                      conversation.roomName[0].toUpperCase(),
                      style: Styles.boldAppColor36
                          .copyWith(color: ColorsValue.primaryColor),
                    )),
              ),
            ),
            Dimens.boxWidth5,
            SizedBox(
              height: Dimens.seventy,
              width: Dimens.screenWidth - Dimens.seventy - Dimens.five,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: Dimens.seventy - 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              conversation.roomName,
                              style: Styles.boldBlack18,
                              overflow: TextOverflow.fade,
                            ),
                            Dimens.boxHeight3,
                            Row(
                              children: [
                                if(conversation.type == 'file')...[
                                  Icon(
                                    CupertinoIcons.folder,
                                    size: Dimens.twenty,
                                    color: ColorsValue.primaryColor,
                                  ),
                                  Dimens.boxWidth10
                                ],
                                Text(
                                  conversation.type == 'file'
                                      ? conversation.message
                                                  .split('/')
                                                  .last
                                                  .length <
                                              20
                                          ? conversation.message.split('/').last
                                          : '${conversation.message.split('/').last.split('.')[0].substring(0, 19)}.${conversation.message.split('.').last}'
                                      : conversation.message,
                                  style: Styles.black14,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                      SizedBox(
                        height: Dimens.seventy - 0.1,
                        width: Dimens.seventy,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                conversation.createdAt.substring(12, 16),
                                style: Styles.black14.copyWith(
                                  color: ColorsValue.darkBlue,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Dimens.boxHeight5,
                            conversation.unreadMessages == 0
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: CircleAvatar(
                                      radius: 10,
                                      backgroundColor: ColorsValue.primaryColor,
                                      child: Center(
                                          child: Text(
                                        '${conversation.unreadMessages}',
                                        style: Styles.white10
                                            .copyWith(fontSize: 10),
                                      )),
                                    ),
                                  )
                          ],
                        ),
                      )
                    ],
                  ),
                  // const Spacer(),
                  Container(
                    height: 0.1,
                    width: Dimens.screenWidth - Dimens.seventy,
                    color: ColorsValue.darkBlue,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
