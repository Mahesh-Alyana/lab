import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/create_group/create_group_controller.dart';
import 'package:dump/app/modules/group_details/group_details_controller.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectUser extends StatelessWidget {
  const SelectUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroupDetailsController>(builder: (logic) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<HomeController>(builder: (home) {
          return Column(
            children: [
              Dimens.boxHeight40,
              Padding(
                padding: const EdgeInsets.only( left: 5),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: 70,
                    child: Row(
                      children: [
                        SizedBox(
                          width:
                          MediaQuery.of(context).size.width-10,
                          child: Card(
                            margin: const EdgeInsets.only(
                                left: 2, right: 2, bottom: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(25),
                            ),
                            child: TextFormField(
                              // controller: logic.message,
                              // focusNode: focusNode,
                              textAlignVertical:
                              TextAlignVertical.center,
                              keyboardType:
                              TextInputType.multiline,
                              maxLines: 2,
                              minLines: 1,
                              onChanged: (value) {
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Type a message",
                                hintStyle: const TextStyle(
                                    color: Colors.grey),
                                prefixIcon: IconButton(
                                  icon: const Icon(
                                    CupertinoIcons.back,
                                    color: ColorsValue.darkBlue,
                                  ),
                                  onPressed: () {
                                    Get.back();
                                  },
                                ), contentPadding:
                              const EdgeInsets.all(5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child:  SizedBox(
                  width: Dimens.screenWidth,
                  child: ListView(
                      children: List.generate(
                          home.allUsers.length,
                          (index) =>
                              InkWell(
                                onTap: (){
                                  if(logic.userIds.contains(home.allUsers[index].id)){
                                    logic.removeUserIds(home.allUsers[index].id);
                                  }else{
                                    logic.addUserIds(home.allUsers[index].id);
                                  }
                                },
                                child: StudentProfileTile(
                                  color: logic.userIds.contains(home.allUsers[index].id)?ColorsValue.primaryColor.withOpacity(0.5):Colors.white,
                                    userDetails: home.allUsers[index]),
                              ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,bottom: 20,right: 10),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: PrimaryButton(onPress: () async {
                    if(logic.userIds.isEmpty){
                      Utility.showError('Select user');
                    }else {
                      await logic.adduserInGroup().then((value) async {
                        for(var i in home.allUsers){
                          if(logic.userIds.contains(i.id)){
                            logic.roomMessageResponse.users.add(i);
                          }
                        }
                        logic.userIds.clear();
                        logic.update();
                        Get.back();
                      });
                    }
                  },text: "Add Users",)
                ),
              ),
            ],
          );
        }),
      );
    });
  }
}
