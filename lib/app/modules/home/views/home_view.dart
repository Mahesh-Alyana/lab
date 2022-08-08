import 'package:dump/app/modules/home/views/pages/settings.dart';
import 'package:dump/app/modules/home/views/pages/students.dart';
import 'package:dump/app/modules/home/views/pages/trainers.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:dump/app/modules/home/views/pages/home.dart';
import 'package:dump/app/theme/theme.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
        builder: (logic) => logic.getUserDetailsResponse == null
            ? Scaffold(
                body: Center(
                  child: SizedBox(
                    height: Dimens.hundred,
                    child: CupertinoTheme(
                      data: CupertinoTheme.of(context).copyWith(
                          brightness: Brightness.dark,
                          primaryColor: Colors.white),
                      child: const CupertinoActivityIndicator(),
                    ),
                  ),
                ),
              )
            : Scaffold(
                //If you want to show body behind the navbar, it should be true
                extendBody: true,
                bottomNavigationBar: FloatingNavbar(
                  backgroundColor: ColorsValue.darkBlue,
                  selectedItemColor: ColorsValue.primaryColor,
                  selectedBackgroundColor: ColorsValue.darkBlue,
                  borderRadius: Dimens.ten,
                  margin: EdgeInsets.fromLTRB(
                      Dimens.ten, Dimens.one, Dimens.ten, Dimens.ten),
                  onTap: logic.changeCurrentIndex,
                  currentIndex: logic.currentIndex,
                  items: logic.getUserDetailsResponse == null
                      ? [ FloatingNavbarItem(
                              icon: CupertinoIcons.chat_bubble_text_fill,
                              title: 'Rooms'), FloatingNavbarItem(
                              icon: CupertinoIcons.settings, title: 'Settings'),]
                      : logic.getUserDetailsResponse!.user.type == 'admin'
                          ? [
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.chat_bubble_text_fill,
                                  title: 'Rooms'),
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.person_alt_circle_fill,
                                  title: 'Trainers'),
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.person_3_fill,
                                  title: 'Students'),
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.settings,
                                  title: 'Settings'),
                            ]
                          : [
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.chat_bubble_text_fill,
                                  title: 'Rooms'),
                              FloatingNavbarItem(
                                  icon: CupertinoIcons.settings,
                                  title: 'Settings'),
                            ],
                ),
                body: IndexedStack(
                    index: logic.currentIndex,
                    children: logic.getUserDetailsResponse == null
                        ? []
                        : logic.getUserDetailsResponse!.user.type == 'admin'
                            ? const [Home(), Trainers(), Students(), Settings()]
                            : const [Home(), Settings()]),
              ),
      );
}
