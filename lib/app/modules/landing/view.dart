import 'package:dump/app/routes/routes_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/landing/controller.dart';
import 'package:dump/app/theme/theme.dart';

class LandingView extends StatelessWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<LandingController>(builder: (logic) => Scaffold(
    resizeToAvoidBottomInset: false,
    body: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Dimens.boxHeight100,
          Container(
            height: Dimens.hundred,
            width: Dimens.hundred*2,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/logo.png'))),
          ),
          Dimens.boxHeight20,
          Text('Dump',style: Styles.boldAppColor36.copyWith(color: ColorsValue.darkBlue),),
          Dimens.boxHeight100,
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
              obscureText: true,
            ),
          ),
          Dimens.boxHeight15,
          PrimaryButton(onPress: (){
            logic.onClickLoginButton();
          },text: 'Login',),
          const Spacer(),
          Dimens.boxHeight5,
          // Text('Design and Developed by Nix',style: Styles.black14,),
          // Dimens.boxHeight15
        ],
      ),
    ),
  ));
}
