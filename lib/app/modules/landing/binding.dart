import 'package:get/get.dart';
import 'package:dump/app/modules/landing/controller.dart';

class LandingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<LandingController>(LandingController.new);
  }
}