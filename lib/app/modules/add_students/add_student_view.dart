import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/add_students/add_student_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentView extends StatelessWidget {
  const AddStudentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(CupertinoIcons.back,size: Dimens.twentyFive,color: ColorsValue.darkBlue,),),
        title: Text('Add Member',style: Styles.black18.copyWith(color: ColorsValue.darkBlue),),),
      body: GetBuilder<AddStudentController>(
        builder: (logic) {
          return Column(
            children: [
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedEmail(value),
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
                  placeholder: 'Gmail',
                  placeholderStyle: Styles.black18,
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: (){
                  logic.onClickCreateUser();
                },text: 'Create ${logic.type}',),
              ),
              Dimens.boxHeight64
            ],
          );
        }
      ),
    );
  }
}
