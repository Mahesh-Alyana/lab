import 'package:dump/app/modules/add_students/add_student_controller.dart';
import 'package:get/get.dart';

class AddStudentBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AddStudentController>(() => AddStudentController());
  }

}