import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsValue.darkBlue,
        title: Text(
          'Reset Password',
          style: Styles.white16,
        ),
      ),
      body: GetBuilder<HomeController>(builder: (logic) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Dimens.boxHeight100,
              Container(
                height: Dimens.fourty,
                constraints: BoxConstraints(maxWidth: Dimens.hundred * 5),
                child: CupertinoTextField(
                  onChanged: (value) => logic.onChangedPassword(value),
                  padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
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
                  onChanged: (value) => logic.onChangedConfirmPassword(value),
                  padding: EdgeInsets.symmetric(horizontal: Dimens.sixTeen),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(4))),
                  cursorColor: ColorsValue.primaryColorLight,
                  clearButtonMode: OverlayVisibilityMode.editing,
                  keyboardType: TextInputType.visiblePassword,
                  maxLines: 1,
                  obscureText: true,
                  placeholder: 'Confirm Password',
                  placeholderStyle: Styles.black18,
                ),
              ),
              Dimens.boxHeight40,
              PrimaryButton(
                onPress: () async {
                  logic.onClickResetButton();
                },
                text: 'Reset password',
              )
            ],
          ),
        );
      }),
    );
  }
}
