import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dump/app/modules/registration/controller.dart';

class RegistrationView extends StatelessWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GetBuilder<RegController>(builder: (logic) => Scaffold(
        body: Column(
          children: [

          ],
        ),
      ));
}
