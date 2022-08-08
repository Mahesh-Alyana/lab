import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/add_collage/add_collage_controller.dart';
import 'package:dump/app/modules/add_students/add_student_controller.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class AddCollageNameView extends StatelessWidget {
  const AddCollageNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCollageNameController>(
        builder: (logic) {
          return Scaffold(
          appBar:AppBar(
            elevation: 0.5,
            backgroundColor: Colors.white,
            actions: [
              IconButton(onPressed: (){
                logic.addCollageNameByExcel();
              }, icon: Icon(CupertinoIcons.folder,size: Dimens.twentyFive,color: ColorsValue.darkBlue,),),
              // IconButton(onPressed: (){
              //   // logic.addCollageNameByExcel();
              // }, icon: Icon(CupertinoIcons.add,size: Dimens.twentyFive,color: ColorsValue.darkBlue,),),
            ],
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(CupertinoIcons.back,size: Dimens.twentyFive,color: ColorsValue.darkBlue,),),
            title: Text('Add Collage',style: Styles.black18.copyWith(color: ColorsValue.darkBlue),),),
          body: Column(
                children: [
                  Dimens.boxHeight15,
                  Container(
                    height: Dimens.fourty,
                    constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                    child: CupertinoTextField(
                      onChanged: (value)=>logic.onChangeCollageName(value),
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
                      placeholder: 'Collage Name',
                      placeholderStyle: Styles.black18,
                    ),
                  ),
                  Expanded(child: SizedBox(
                    child: ListView(
                      children: List.generate(logic.collageList.length, (index) => Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              flex: 2,
                              onPressed: (BuildContext context) async {
                                await logic.deleteCollageNameById(logic.collageList[index].id);
                              },
                              backgroundColor: ColorsValue.primaryColor,
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Remove',
                            ),
                          ],
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(logic.collageList[index].name,style: Styles.black18,),
                          ),
                        ),
                      )),
                    ),
                  )),
                  // const Spacer(),
                  logic.collageName.isEmpty?SizedBox():Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PrimaryButton(onPress: (){
                      logic.onClickAddCollage();
                    },text: 'Add',),
                  ),
                  Dimens.boxHeight64
                ],
              )
        );
      }
    );
  }
}
