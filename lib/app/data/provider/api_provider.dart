import 'package:dio/dio.dart';
import 'package:dump/app/data/model/response/add_collage_response.dart';
import 'package:dump/app/data/model/response/create_room_response.dart';
import 'package:dump/app/data/model/response/create_user_from_excel_response.dart';
import 'package:dump/app/data/model/response/create_user_response.dart';
import 'package:dump/app/data/model/response/get_all_users_details_response.dart';
import 'package:dump/app/data/model/response/get_collage_details_response.dart';
import 'package:dump/app/data/model/response/get_user_details_response.dart';
import 'package:dump/app/data/model/response/login_response.dart';
import 'package:dump/app/data/model/response/recent_conversation_response.dart';
import 'package:dump/app/data/model/response/room_update_response.dart';
import 'package:dump/app/data/model/response/update_user_response.dart';
import 'package:dump/app/data/model/response/user_create_response.dart';
import 'package:retrofit/http.dart';

part 'api_provider.g.dart';

@RestApi(baseUrl: 'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:80/api/v1')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
    );

    return _ApiService(dio, baseUrl: baseUrl);
  }

  ///=============================== Users Related requests ========================================================================

  @POST('/user/login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> body);

  @POST('/user/update')
  Future<UpdateUserResponse> updateUser(@Body() Map<String, dynamic> body,@Header('Authorization') String token);

  @DELETE('/user/delete')
  Future<UsersCreateResponse> deleteUser(@Body() Map<String, dynamic> body);

  @POST('/user/create')
  Future<CreateUserResponse> createUser(@Body() Map<String, dynamic> body,@Header('Authorization') String token);

  @GET('/user/fetch')
  Future<GetAllUserDetailsResponse> getAllUsersDetails(@Header('Authorization') String token);

  @GET('/user/detail')
  Future<GetUserDetailsResponse> getUserDetails(@Header('Authorization') String token);

  @POST('/user/create/userLists')
  Future<CreateUserFromExcelResponse> createUsersByList(@Body() Map<String, dynamic> body);

  ///=============================== Rooms Related requests ========================================================================

  @GET('/room/')
  Future<RecentConversationResponse> getRecentChatDetails(@Header('Authorization') String token);

  @GET('/fetch/room-detail')
  Future<RecentConversationResponse> getRoomDetails(@Header('Authorization') String token);

  @POST('/room/initiate')
  Future<CreateRoomResponse> createRoom(@Body() Map<String, dynamic> body,@Header('Authorization') String token);

  @PUT('/room/add/users')
  Future<RoomUpdateResponse> addUsersInRoom(@Body() Map<String, dynamic> body,@Header('Authorization') String token);

  @DELETE('/room/delete/users')
  Future<RoomUpdateResponse> removeUserFromRoom(@Body() Map<String, dynamic> body,@Header('Authorization') String token);

///=============================== Collage Related requests ========================================================================
  @POST('/collage/addByList')
  Future<AddCollageResponse> addCollageByList(@Body() Map<String, dynamic> body);

  @DELETE('/collage/delete')
  Future<RoomUpdateResponse> deleteCollage(@Body() Map<String, dynamic> body);

  @GET('/collage/collages')
  Future<GetCollageResponse> getAllCollage();

}
