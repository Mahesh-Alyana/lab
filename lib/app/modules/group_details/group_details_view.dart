import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/group_details/group_details_controller.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class GroupDetailsView extends StatelessWidget {
  const GroupDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupDetailsController>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ColorsValue.darkBlue,
            title: Text(logic.conversation.roomName,style: Styles.white16,),
            actions: [
              IconButton(
                  onPressed: () {
                    RoutesManagement.goToSelectUser();
                  },
                  icon: Icon(
                    CupertinoIcons.add,
                    size: Dimens.twentyFive,
                    color: ColorsValue.primaryColor,
                  ))
            ],
          ),
          body: Column(
            children: [
              Container(
                height: Dimens.fourty,
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(width: 0.5, color: ColorsValue.darkBlue)),
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangeStudentSearchMail(value),
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
                child: logic.studentSearch.isNotEmpty
                    ?ListView(
                    children: List.generate(
                        logic.studentSearch.length,
                            (index) =>
                            Slidable(
                              key: ValueKey(index),
                              endActionPane:  ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    flex: 2,
                                    onPressed:(BuildContext context){
                                      var id = logic.studentSearch[index].id;
                                      logic.removeUserFromGroup(logic.studentSearch[index]);
                                    },
                                    backgroundColor: ColorsValue.primaryColor,
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Remove',
                                  ),
                                ],
                              ),
                              child: StudentProfileTile(
                                  color:Colors.white,
                                  userDetails: logic.studentSearch[index]),
                            ))
                )
                    :ListView(
                  children: List.generate(
                      logic.roomMessageResponse.users.length,
                          (index) =>
                              Slidable(
                                key: ValueKey(index),
                                endActionPane:  ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed:(BuildContext context){
                                        var id = logic.roomMessageResponse.users[index].id;
                                        logic.removeUserFromGroup(logic.roomMessageResponse.users[index]);
                                      },
                                      backgroundColor: ColorsValue.primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Remove',
                                    ),
                                  ],
                                ),
                            child: StudentProfileTile(
                                color:Colors.white,
                                userDetails: logic.roomMessageResponse.users[index]),
                          ))
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: ()async {
                  await logic.chatRoomController.deleteGroupById(logic.conversation.chatRoomId).then((value) async {
                    await Get.find<HomeController>();
                    RoutesManagement.goToHomeView();
                  });
                  Utility.closeDialog();
                }, text: 'Delete group',),
              ),
              Dimens.boxHeight40
            ],
          ),
        );
      }
    );
  }
}
