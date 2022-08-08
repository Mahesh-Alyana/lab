part of 'app_pages.dart';


/// A chunks of routes and the path names which will be used to create
/// routes in [AppPages].
abstract class AppRoutes{
  static const login = _Paths.login;
  static const landing = _Paths.landing;
  static const updateProfile = _Paths.updateProfile;
  static const home = _Paths.home;
  static const createGroup = _Paths.createGroup;
  static const addParticipants = _Paths.addParticipants;
  static const addMember = _Paths.addMember;
  static const chatScreen = _Paths.chatScreen;
  static const roomDetails = _Paths.roomDetails;
  static const selectUser = _Paths.selectUser;
  static const imagePath = _Paths.imagePath;
  static const webView = _Paths.webView;
  static const createUserFromExcel = _Paths.createUserFromExcel;
  static const addCollageName =_Paths.addCollageName;
  static const addCollageFromExcel = _Paths.addCollageFromExcel;
  static const resetPassword = _Paths.resetPassword;

}

abstract class _Paths{
  static const login = '/login';
  static const landing = '/landing';
  static const updateProfile = '/update_profile';
  static const home = '/home';
  static const createGroup = '/create_group';
  static const addParticipants = '/add_participants';
  static const addMember = '/add_member';
  static const chatScreen = '/chat_screen';
  static const roomDetails = '/room_details';
  static const selectUser = '/select_user';
  static const imagePath = '/image_path';
  static const webView = '/webView';
  static const createUserFromExcel = '/create_user_from_excel';
  static const addCollageName = '/add_collage_name';
  static const addCollageFromExcel = '/add_collage_name_from_excel';
  static const resetPassword = '/reset_password';

}