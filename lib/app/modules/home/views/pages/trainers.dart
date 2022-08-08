import 'package:dump/app/global_widget/is_admin_widget.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/local_widget/student_profile_tile.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class Trainers extends StatelessWidget {
  const Trainers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GetBuilder<HomeController>(builder: (logic) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.5,
              backgroundColor: Colors.white,
              actions: [
                IsAdminWidget(
                  isAdminWidgetOnly: true,
                  bothAdminAndTrainer: false,
                  child: IconButton(
                      onPressed: () {
                        RoutesManagement.goToAddStudentView('trainer', []);
                      },
                      icon: Icon(
                        CupertinoIcons.add,
                        color: ColorsValue.darkBlue,
                        size: Dimens.twentyFive,
                      )),
                )
              ],
              leading: Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: Dimens.twentyFive,
                color: ColorsValue.primaryColor,
              ),
              title: Text(
                'Trainers',
                style: Styles.black18.copyWith(color: ColorsValue.darkBlue),
              ),
            ),
            body: RefreshIndicator(
              color: ColorsValue.darkBlue,
              onRefresh: () async => await logic.getAllUsersDetails(),
              child: Column(
                children: [
                  Container(
                    height: Dimens.fourty,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 0.5,color: ColorsValue.darkBlue)
                    ),
                    constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                    child: CupertinoTextField(
                      onChanged: (value)=>logic.onChangeTeacherSearchMail(value),
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimens.sixTeen),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius:
                          const BorderRadius.all(Radius.circular(4))),
                      cursorColor: ColorsValue.primaryColorLight,
                      clearButtonMode: OverlayVisibilityMode.editing,
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      prefix: const Padding(
                        padding: EdgeInsets.only(left:8.0),
                        child: Icon(CupertinoIcons.search),
                      ),
                      placeholder: 'Search teacher by mail',
                      placeholderStyle: Styles.black18,
                    ),
                  ),
                  Expanded(
                    child: logic.teacherSearch.isNotEmpty
                        ?ListView(
                        children: List.generate(
                            logic.teacherSearch.length,
                                (index) => Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (BuildContext context) async {
                                        await logic
                                            .deleteUserById(logic.teacherSearch[index].id)
                                            .then((value) {
                                          logic.teacherSearch
                                              .remove(logic.teacherSearch[index]);
                                        });
                                      },
                                      backgroundColor: ColorsValue.primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: StudentProfileTile(
                                  userDetails: logic.teacherSearch[index],
                                ))))
                        :ListView(
                        children: List.generate(
                            logic.teachers.length,
                            (index) => Slidable(
                                key: ValueKey(index),
                                endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      flex: 2,
                                      onPressed: (BuildContext context) async {
                                        await logic
                                            .deleteUserById(logic.teachers[index].id)
                                            .then((value) {
                                          logic.teachers
                                              .remove(logic.teachers[index]);
                                        });
                                      },
                                      backgroundColor: ColorsValue.primaryColor,
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Delete',
                                    ),
                                  ],
                                ),
                                child: StudentProfileTile(
                                  userDetails: logic.teachers[index],
                                )))),
                  ),
                ],
              ),
            ));
      });
}
