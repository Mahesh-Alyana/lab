import 'package:dump/app/modules/group_details/group_details_controller.dart';
import 'package:get/get.dart';

class GroupDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<GroupDetailsController>(() => GroupDetailsController());
  }

}