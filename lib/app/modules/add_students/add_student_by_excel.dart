
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/add_students/add_student_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStudentFromExcel extends StatelessWidget {
  const AddStudentFromExcel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddStudentController>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              'Create Student From Excel',
              style: Styles.black18.copyWith(color: ColorsValue.darkBlue),
            ),
            centerTitle: true,
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
          body: Column(
            children: [
              Expanded(child:ListView(
                children: List.generate(logic.gmail.length, (index) => Card(
                  child: SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.thirty,
                    child: Center(child: Text(logic.gmail[index], style: Styles.black14,)),
                  ),
                )),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: (){
                  logic.createUserFromList();
                }, text: 'Create users',),
              ),
              Dimens.boxHeight40
            ],
          ),
        );
      }
    );
  }
}
