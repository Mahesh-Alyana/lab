import 'package:dump/app/data/model/entity/conversation.dart';
import 'package:dump/app/data/model/response/login_response.dart';
import 'package:dump/app/data/model/response/room_message_response.dart';
import 'package:dump/app/modules/add_collage/add_collage_by_excel.dart';
import 'package:dump/app/modules/add_collage/add_collage_view.dart';
import 'package:dump/app/modules/add_students/add_student_by_excel.dart';
import 'package:dump/app/modules/add_students/add_student_view.dart';
import 'package:dump/app/modules/chat_room/chat_room_view.dart';
import 'package:dump/app/modules/chat_room/preview_image.dart';
import 'package:dump/app/modules/create_group/create_group_views.dart';
import 'package:dump/app/modules/create_group/select_user_view.dart';
import 'package:dump/app/modules/group_details/select_user_view.dart';
import 'package:dump/app/modules/home/views/home_view.dart';
import 'package:dump/app/modules/home/views/pages/reset_password.dart';
import 'package:dump/app/modules/update_profile/update_profile_view.dart';
import 'package:dump/app/modules/web_view/web_view.dart';
import 'package:get/get.dart';
import 'package:dump/app/modules/landing/view.dart';
import 'package:dump/app/routes/app_pages.dart';

abstract class RoutesManagement{
  /// Go to the [LoginView] screen.
  static void goToLoginView() {
    Get.offAllNamed<void>(AppRoutes.landing);
  }
  /// Go to the [UpdateProfileView] screen.
  static void goToUpdateProfileView(LoginResponse loginResponse) {
    Get.toNamed<void>(AppRoutes.updateProfile, arguments: loginResponse);
  }

  /// Go to the [AddStudentView] screen.
  static void goToAddStudentView(String type,List<String> users) {
    Get.toNamed<void>(AppRoutes.addMember, arguments:  [type, users]);
  }

  /// Go to the [AddStudentFromExcel] screen.
  static void goToAddStudentFromExcel(String type, List<String> users) {
    Get.toNamed<void>(AppRoutes.createUserFromExcel, arguments: [type, users]);
  }

  /// Go to the [LandingView] screen.
  static void goToLandingView() {
    Get.offAllNamed<void>(AppRoutes.landing);
  }

  /// Go to the [HomeView] screen.
  static void goToHomeView() {
    Get.toNamed<void>(AppRoutes.home);
  }
  /// Go to the [AddParticipants] screen.
  static void goToAddParticipants() {
    Get.toNamed<void>(AppRoutes.addParticipants);
  }


  /// Go to the [CreateGroupView] screen.
  static void goToCreateGroupView() {
    Get.toNamed<void>(AppRoutes.createGroup);
  }
  /// Go to the [ChatRoomDetails] screen.
  static void goToChatRoomDetails(RoomMessageResponse roomMessageResponse, Conversation conversation) {
    Get.toNamed<void>(AppRoutes.roomDetails, arguments: [roomMessageResponse, conversation]);
  }

  /// Go to the [ChatRoomView] screen.
  static void goToChatRoomView(Conversation conversation) {
    Get.toNamed<void>(AppRoutes.chatScreen, arguments: conversation);
  }

  /// Go to the [PdfWebView] screen.
  static void goToPdfWebView(String url) {
    Get.toNamed<void>(AppRoutes.webView, arguments: url);
  }

  /// Go to the [SelectUser] screen.
  static void goToSelectUser() {
    Get.toNamed<void>(AppRoutes.selectUser,);
  }

  /// Go to the [PreViewImageAndSend] screen.
  static void goToPreViewImageAndSend() {
    Get.toNamed<void>(AppRoutes.imagePath,);
  }

  /// Go to the [AddCollageNameView] screen.
  static void goToAddCollageNameView() {
    Get.toNamed<void>(AppRoutes.addCollageName,);
  }
  /// Go to the [AddCollageNameFromExcel] screen.
  static void goToAddCollageNameFromExcel() {
    Get.toNamed<void>(AppRoutes.addCollageFromExcel,);
  }

  /// Go to the [ResetPassword] screen.
  static void goToResetPassword() {
    Get.toNamed<void>(AppRoutes.resetPassword,);
  }
}