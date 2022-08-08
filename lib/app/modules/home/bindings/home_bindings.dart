import 'package:get/get.dart';
import 'package:dump/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(HomeController.new);
  }

}