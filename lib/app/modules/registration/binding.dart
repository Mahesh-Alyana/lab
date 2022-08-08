import 'package:get/get.dart';
import 'package:dump/app/modules/registration/controller.dart';

class RegBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RegController>(RegController.new);
  }
}