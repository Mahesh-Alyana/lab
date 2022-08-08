import 'package:dump/app/modules/create_group/create_group_controller.dart';
import 'package:get/get.dart';

class CreateGroupBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<CreateGroupController>(() => CreateGroupController());
  }

}