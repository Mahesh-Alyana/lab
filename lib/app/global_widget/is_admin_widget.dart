import 'package:dump/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsAdminWidget extends StatelessWidget {
  const IsAdminWidget(
      {Key? key,
      required this.child,
      required this.isAdminWidgetOnly,
      required this.bothAdminAndTrainer})
      : super(key: key);
  final Widget child;
  final bool isAdminWidgetOnly;
  final bool bothAdminAndTrainer;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (logic) {
      return logic.getUserDetailsResponse == null
          ? const SizedBox()
          : isAdminWidgetOnly
              ? logic.getUserDetailsResponse!.user.type == 'admin'
                  ? child
                  : const SizedBox()
              : bothAdminAndTrainer
                  ? logic.getUserDetailsResponse!.user.type == 'admin' ||
                          logic.getUserDetailsResponse!.user.type == 'trainer'
                      ? child
                      : const SizedBox()
                  : const SizedBox();
    });
  }
}
