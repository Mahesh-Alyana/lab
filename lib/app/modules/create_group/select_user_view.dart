import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/create_group/create_group_controller.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddParticipants extends StatelessWidget {
  const AddParticipants({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateGroupController>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: ColorsValue.darkBlue,
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Add Participants',
            style: Styles.white16,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.back,
                size: Dimens.twentyFive,
                color: Colors.white,
              )),
        ),
        body:Column(
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
                    ? ListView(
                        children: List.generate(
                            logic.studentSearch.length,
                            (index) => logic.studentSearch[index].id ==
                                    logic.home.getUserDetailsResponse!.user.id
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      if (logic.userIds
                                          .contains(logic.studentSearch[index].id)) {
                                        logic
                                            .removeMember(logic.studentSearch[index]);
                                        logic.removeMemberId(
                                            logic.studentSearch[index].id);
                                      } else {
                                        logic.addMember(logic.studentSearch[index]);
                                        logic.addMemberId(
                                            logic.studentSearch[index].id);
                                      }
                                    },
                                    child: StudentProfileTile(
                                        color: logic.userIds.contains(
                                                logic.studentSearch[index].id)
                                            ? ColorsValue.primaryColor
                                                .withOpacity(0.5)
                                            : Colors.white,
                                        userDetails: logic.studentSearch[index]),
                                  )))
                    : ListView(
                        children: List.generate(
                            logic.home.allUsers.length,
                            (index) => logic.home.allUsers[index].id ==
                                    logic.home.getUserDetailsResponse!.user.id
                                ? const SizedBox()
                                : InkWell(
                                    onTap: () {
                                      if (logic.userIds
                                          .contains(logic.home.allUsers[index].id)) {
                                        logic
                                            .removeMember(logic.home.allUsers[index]);
                                        logic.removeMemberId(
                                            logic.home.allUsers[index].id);
                                      } else {
                                        logic.addMember(logic.home.allUsers[index]);
                                        logic.addMemberId(
                                            logic.home.allUsers[index].id);
                                      }
                                    },
                                    child: StudentProfileTile(
                                        color: logic.userIds.contains(
                                                logic.home.allUsers[index].id)
                                            ? ColorsValue.primaryColor
                                                .withOpacity(0.5)
                                            : Colors.white,
                                        userDetails: logic.home.allUsers[index]),
                                  ))),
              ),
            ],
          )
      );
    });
  }
}
