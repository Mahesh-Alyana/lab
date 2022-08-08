import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/update_profile/update_profile_contaoller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateProfileController>(
      builder: (logic) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar:AppBar(
            elevation: 0.5,
            backgroundColor: Colors.white,
            leading: IconButton(onPressed: (){
              Get.back();
            }, icon: Icon(CupertinoIcons.back,size: Dimens.twentyFive,color: ColorsValue.darkBlue,),),
            title: Text('Update Profile',style: Styles.black18.copyWith(color: ColorsValue.darkBlue),),),

          body: Column(
            children: [
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedFirstName(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  placeholder: 'First Name',
                  placeholderStyle: Styles.black18,
                ),
              ),
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedLastName(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  placeholder: 'last Name',
                  placeholderStyle: Styles.black18,
                ),
              ),
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedMobile(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  placeholder: 'Mobile',
                  placeholderStyle: Styles.black18,
                ),

              ),
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedCollage(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  readOnly: true,
                  onTap: (){
                    logic.collegeBottomSheet();
                  },
                  placeholder: logic.collage.isNotEmpty?logic.collage:'Collage',
                  placeholderStyle: Styles.black18,
                ),
              ),
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedPassword(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  placeholder: 'Password',
                  placeholderStyle: Styles.black18,
                ),

              ),
              Dimens.boxHeight15,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value)=>logic.onChangedConfirmPassword(value),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius:
                      const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  obscureText: true,
                  placeholder: 'Confirm Password',
                  placeholderStyle: Styles.black18,
                ),

              ),
              Dimens.boxHeight15,
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: (){
                  logic.onClickUpdateProfile();
                },text:'Submit'),
              ),
              Dimens.boxHeight40,
            ],
          ),
        );
      }
    );
  }
}
