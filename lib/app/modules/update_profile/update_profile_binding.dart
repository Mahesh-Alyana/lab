import 'package:dump/app/modules/update_profile/update_profile_contaoller.dart';
import 'package:get/get.dart';

class UpdateProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<UpdateProfileController>(() => UpdateProfileController());
  }
}