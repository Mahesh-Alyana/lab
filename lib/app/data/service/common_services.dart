import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart' as io;
import 'package:connectivity/connectivity.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dump/app/data/provider/api_provider.dart';
import 'package:dump/app/utils/permissions.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class CommonService extends GetxService{


  /// This is used for internet change listener
  StreamSubscription? _streamSubscription;

  /// Starts the check for internet connectivity. If there is no connection
  /// with the internet a text message will be shown. If the application
  /// is not able to connect to the internet even if the connection is available
  /// will ask the user to check the internet permission.
  void _checkForInternetConnectivity() {
    _streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      if (result != ConnectivityResult.none) {
        Utility.closeDialog();
      } else {
        Utility.showNoInternetDialog();
      }
    });
  }

  @override
  void onInit() async {
    _checkForInternetConnectivity();
    // deviceId = await getId();
    // addressResponse = await getAddress();
    super.onInit();
  }

  @override
  void onClose() {
    _streamSubscription!.cancel();
    super.onClose();
  }

  final box = GetStorage();

  Future<void> writeToken(String value) async {
    await box.write('token', 'Bearer $value');
  }

  Future<dynamic> readToken() async {
    var token = await box.read('token');
    // Utility.printDLog('Token Store: $token');
    return token ?? '';
  }

  ApiService apiService = ApiService(dio.Dio());

  Future<String?> getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // Unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // Unique ID on Android
    }
  }

  final picker = ImagePicker();

  /// Opens the gallery/file application for the user to pick the image.
  Future<String> getImagePathFromGallery() async {
    try {
      if (await Permissions.checkStoragePermission()) {
        final pickedFile = await picker.pickImage(
            source: ImageSource.gallery,
            imageQuality: 50
        );
        if (pickedFile != null) {
          return pickedFile.path;
        } else {
          Utility.showError('Image Not Found Error');
        }
      }
    }
    catch(error){
      Utility.showError('Error in selecting photo make be wrong file extension');
    }
    return ' ';
  }

  /// Opens the camera application for the user to pick the image.
  Future<String> getImagePathFromCamera() async {
    if (await Permissions.checkCameraPermission()) {
      final pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 50
      );
      if (pickedFile != null) {
        return pickedFile.path;
      } else {
        Utility.showError('Image Not Found Error');
      }
    }
    Utility.showError('Give camera permission to app');
    return '';
  }

  Future<String> uploadImage(String filePath,String roomId) async {
    var url = 'http://ec2-13-235-243-217.ap-south-1.compute.amazonaws.com:8080/upload/$roomId';
    final dio = io.Dio();
    String fileName = filePath.split('/').last;
    io.FormData formData = io.FormData.fromMap({
      "file": await io.MultipartFile.fromFile(filePath, filename:fileName),
    });
    var response = await dio.post("$url/", data: formData);
    return fileName;
  }
}