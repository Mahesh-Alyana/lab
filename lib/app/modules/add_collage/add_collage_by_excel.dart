
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/add_collage/add_collage_controller.dart';
import 'package:dump/app/modules/add_students/add_student_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCollageNameFromExcel extends StatelessWidget {
  const AddCollageNameFromExcel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCollageNameController>(
      builder: (logic) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.5,
            title: Text(
              'Add Collage Name From Excel',
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
              Expanded(child:logic.collages.isEmpty?SizedBox(
                width: Dimens.screenWidth,
                child: Center(child: Text('No Collage name found in Excel',style: Styles.black18,)),
              ):ListView(
                children: List.generate(logic.collages.length, (index) => Card(
                  child: SizedBox(
                    width: Dimens.screenWidth,
                    height: Dimens.thirty,
                    child: Center(child: Text(logic.collages[index], style: Styles.black14,)),
                  ),
                )),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: ()async {
                  await logic.addCollageName(logic.collages);
                  Get.back();
                }, text: 'Add',),
              ),
              Dimens.boxHeight40
            ],
          ),
        );
      }
    );
  }
}
