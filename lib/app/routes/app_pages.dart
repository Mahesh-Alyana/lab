import 'package:dump/app/modules/add_collage/add_collage_binding.dart';
import 'package:dump/app/modules/add_collage/add_collage_by_excel.dart';
import 'package:dump/app/modules/add_collage/add_collage_view.dart';
import 'package:dump/app/modules/add_students/add_student_binding.dart';
import 'package:dump/app/modules/add_students/add_student_by_excel.dart';
import 'package:dump/app/modules/add_students/add_student_view.dart';
import 'package:dump/app/modules/chat_room/chat_room_binding.dart';
import 'package:dump/app/modules/chat_room/chat_room_details.dart';
import 'package:dump/app/modules/chat_room/chat_room_view.dart';
import 'package:dump/app/modules/chat_room/preview_image.dart';
import 'package:dump/app/modules/create_group/create_group_binding.dart';
import 'package:dump/app/modules/create_group/create_group_views.dart';
import 'package:dump/app/modules/create_group/select_user_view.dart';
import 'package:dump/app/modules/group_details/group_details_binding.dart';
import 'package:dump/app/modules/group_details/group_details_view.dart';
import 'package:dump/app/modules/group_details/select_user_view.dart';
import 'package:dump/app/modules/home/views/pages/reset_password.dart';
import 'package:dump/app/modules/update_profile/update_profile_binding.dart';
import 'package:dump/app/modules/update_profile/update_profile_view.dart';
import 'package:dump/app/modules/web_view/web_view.dart';
import 'package:dump/app/modules/web_view/web_view_binding.dart';
import 'package:get/get.dart';
import 'package:dump/app/modules/home/bindings/home_bindings.dart';
import 'package:dump/app/modules/home/views/home_view.dart';
import 'package:dump/app/modules/landing/binding.dart';
import 'package:dump/app/modules/landing/view.dart';

part 'app_routes.dart';

/// Contains the list of pages or routes taken across the whole application.
/// This will prevent us in using context for navigation. And also providing
/// the blocs required in the next named routes.
///
/// [pages] : will contain all the pages in the application as a route
///                 and will be used in the material app.
abstract class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 300,
  );

  static final pages = <GetPage>[
    // GetPage<dynamic>(
    //   name: _Paths.login,
    //   transitionDuration: transitionDuration,
    //   page: LoginView.new,
    //   binding: LoginBinding(),
    //   transition: Transition.downToUp,
    // ),
    GetPage<dynamic>(
      name: _Paths.landing,
      transitionDuration: transitionDuration,
      page: LandingView.new,
      binding: LandingBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.updateProfile,
      transitionDuration: transitionDuration,
      page: UpdateProfileView.new,
      binding: UpdateProfileBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.home,
      transitionDuration: transitionDuration,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.addParticipants,
      transitionDuration: transitionDuration,
      page: AddParticipants.new,
      binding: CreateGroupBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.createGroup,
      transitionDuration: transitionDuration,
      page: CreateGroupView.new,
      binding: CreateGroupBinding(),
      transition: Transition.downToUp,
    ),

    GetPage<dynamic>(
      name: _Paths.addMember,
      transitionDuration: transitionDuration,
      page: AddStudentView.new,
      binding: AddStudentBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.createUserFromExcel,
      transitionDuration: transitionDuration,
      page: AddStudentFromExcel.new,
      binding: AddStudentBinding(),
      transition: Transition.downToUp,
    ),

    GetPage<dynamic>(
      name: _Paths.chatScreen,
      transitionDuration: transitionDuration,
      page: ChatRoomView.new,
      binding: ChatRoomBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.roomDetails,
      transitionDuration: transitionDuration,
      page: GroupDetailsView.new,
      binding: GroupDetailsBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.selectUser,
      transitionDuration: transitionDuration,
      page: SelectUser.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.imagePath,
      transitionDuration: transitionDuration,
      page: PreViewImageAndSend.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.webView,
      transitionDuration: transitionDuration,
      page: PdfWebView.new,
      binding: WebViewBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.addCollageName,
      transitionDuration: transitionDuration,
      page: AddCollageNameView.new,
      binding: AddCollageBinding(),
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.addCollageFromExcel,
      transitionDuration: transitionDuration,
      page: AddCollageNameFromExcel.new,
      transition: Transition.downToUp,
    ),
    GetPage<dynamic>(
      name: _Paths.resetPassword,
      transitionDuration: transitionDuration,
      page: ResetPassword.new,
      transition: Transition.downToUp,
    ),

  ];
}