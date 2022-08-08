import 'package:dump/app/modules/add_collage/add_collage_controller.dart';
import 'package:get/get.dart';

class AddCollageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddCollageNameController>(() => AddCollageNameController());
  }

}