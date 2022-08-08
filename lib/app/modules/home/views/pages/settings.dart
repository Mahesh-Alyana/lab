
import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/global_widget/is_admin_widget.dart';
import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder: (logic) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          backgroundColor: Colors.white,
          leading: Icon(CupertinoIcons.settings_solid,size: Dimens.twentyFive,color: ColorsValue.primaryColor,),
          title: Text('Settings',style: Styles.black18.copyWith(color: ColorsValue.darkBlue),),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              if(logic.getUserDetailsResponse != null) ...[
                Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.person,size: Dimens.twentyFive,color: ColorsValue.primaryColor,),
                    title: Text('Name',style: Styles.black18,),
                    subtitle: Text('${logic.getUserDetailsResponse!.user.firstName} ${logic.getUserDetailsResponse!.user.lastName}',style: Styles.black14,),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.phone,size: Dimens.twentyFive,color: ColorsValue.primaryColor,),
                    title: Text('Mobile',style: Styles.black18,),
                    subtitle: Text(logic.getUserDetailsResponse!.user.mobile,style: Styles.black14,),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(CupertinoIcons.shield_lefthalf_fill,size: Dimens.twentyFive,color: ColorsValue.primaryColor,),
                    title: Text('Role',style: Styles.black18,),
                    subtitle: Text(logic.getUserDetailsResponse!.user.type.toUpperCase(),style: Styles.black14,),
                  ),
                ),
              ],
              Dimens.boxHeight100,
              PrimaryButton(onPress: () async {
                RoutesManagement.goToResetPassword();
              },text: 'Reset Password',),
              Dimens.boxHeight20,
              IsAdminWidget(
                isAdminWidgetOnly: true,
                bothAdminAndTrainer: false,
                child: PrimaryButton(onPress: () async {
                  RoutesManagement.goToAddCollageNameView();
                },text: 'Collage',),
              ),
              Dimens.boxHeight20,
              PrimaryButton(onPress: () async {
                await Get.find<CommonService>().box.remove('token');
                RoutesManagement.goToLoginView();
              },text: 'Logout',),
              Dimens.boxHeight64,
              Dimens.boxHeight20,
              Dimens.boxHeight20,

            ],
          ),
        ),
      );
    }
  );
}
