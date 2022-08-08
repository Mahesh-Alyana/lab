import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/create_group/create_group_controller.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/local_widget/room_chat_tile.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CreateGroupView extends StatelessWidget {
  const CreateGroupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          'Create Group',
          style: Styles.black18.copyWith(color: ColorsValue.darkBlue),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              CupertinoIcons.back,
              size: Dimens.twentyFive,
              color: ColorsValue.darkBlue,
            )),
      ),
      body: GetBuilder<CreateGroupController>(builder: (logic) {
        return Column(
          children: [
            Container(
              height: Dimens.fourty,
              constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
              child: CupertinoTextField(
                onChanged: (value) => logic.onChangedGroupName(value),
                padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                cursorColor: ColorsValue.primaryColorLight,
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                placeholder: 'Group Name',
                placeholderStyle: Styles.black18,
              ),
            ),
            Dimens.boxHeight10,
            Row(
              children: [
                Text(
                  '   Add Participants',
                  style: Styles.black18.copyWith(color: ColorsValue.darkBlue),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      logic.showAddParticipantBottomSheet();
                    },
                    icon: Icon(
                      CupertinoIcons.add,
                      size: Dimens.twentyFive,
                      color: ColorsValue.primaryColor,
                    ))
              ],
            ),
            Container(
              height: Dimens.fourty,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 0.5, color: ColorsValue.darkBlue)),
              constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
              child: CupertinoTextField(
                onChanged: (value) => logic.onChangeUserSearchMail(value),
                padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                cursorColor: ColorsValue.primaryColorLight,
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.emailAddress,
                maxLines: 1,
                prefix: const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(CupertinoIcons.search),
                ),
                placeholder: 'Search user by mail',
                placeholderStyle: Styles.black18,
              ),
            ),
            Expanded(
                child: SizedBox(
              width: Dimens.screenWidth,
              child: logic.userSearch.isNotEmpty
                  ? ListView(
                      children: List.generate(
                          logic.userSearch.length,
                          (index) => Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (BuildContext context) {
                                        var id = logic.userSearch[index].id;
                                        logic
                                            .removeMember(logic.userSearch[index]);
                                        logic.removeMemberId(id);
                                      },
                                      backgroundColor: ColorsValue.primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: StudentProfileTile(
                                    userDetails: logic.userSearch[index]),
                              )),
                    )
                  : ListView(
                      children: List.generate(
                          logic.members.length,
                          (index) => Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (BuildContext context) {
                                        var id = logic.members[index].id;
                                        logic
                                            .removeMember(logic.members[index]);
                                        logic.removeMemberId(id);
                                      },
                                      backgroundColor: ColorsValue.primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: StudentProfileTile(
                                    userDetails: logic.members[index]),
                              )),
                    ),
            )), // const Spacer(),
            Dimens.boxHeight30,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PrimaryButton(
                onPress: () {
                  logic.createGroup();
                },
                text: 'Create Group',
              ),
            ),
            Dimens.boxHeight30
          ],
        );
      }),
    );
  }
}
