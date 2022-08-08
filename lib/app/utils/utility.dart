import 'package:dio/dio.dart' as io;
import 'package:dump/app/global_widget/no_internet_widget.dart';
import 'package:dump/app/modules/chat_room/preview_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:logger/logger.dart';

abstract class Utility {
  static String toTitleString(String value)=> value.replaceAll(RegExp(' +'), ' ').split(' ').map<dynamic>((str) => str.toCapitalized()).join(' ');

  /// Print debug log
  ///
  /// [message] : The message which needed to be print.
  static void printDLog(String message) {
    Logger().d(message);
  }

  /// Print info log.
  ///
  /// [message] : The message which needed to be print.
  static void printILog(String message) {
    Logger().i(message);
  }

  /// Print error log.
  ///
  /// [message] : The message which needed to be print.
  static void printELog(String message) {
    Logger().e(message);
  }

  /// Show no internet dialog if there is no
  /// internet available.
  static void showNoInternetDialog() {
    closeDialog();
    Get.dialog<void>(
      const NoInternetWidget(),
      barrierDismissible: false,
    );
  }

  /// Show a loading progress indicator
  /// on top of the screen.
  static void showLoadingDialog() {
    closeDialog();
    Get.dialog<void>(
      WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SizedBox(
              height: Dimens.hundred,
              child:
              CupertinoTheme(
                data: CupertinoTheme.of(Get.context!)
                    .copyWith(
                    brightness: Brightness.dark,
                    primaryColor: Colors.white
                ),
                child: const CupertinoActivityIndicator(),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static bool checkUrlIsImage(String url){
    var isImage = false;
    var tail = url.split('.').last;
    if(tail == 'jpg' || tail == 'png'){
      isImage = true;
    }
    return isImage;
  }

  static bool checkUrlIsPed(String url){
    var isImage = false;
    var tail = url.split('.').last;
    if(tail == 'pdf'){
      isImage = true;
    }
    return isImage;
  }

  /// Returns a list of booleans by validating [password].
  ///
  /// for at least one upper case, at least one digit,
  /// at least one special character and and at least 6 characters long
  /// return [List<bool>] for each case.
  /// Validation logic
  /// r'^
  ///   (?=.*[A-Z])             // should contain at least one upper case
  ///   (?=.*?[0-9])            // should contain at least one digit
  ///  (?=.*?[!@#\$&*~]).{8,}   // should contain at least one Special character
  /// $
  static List<bool> passwordValidator(String password) {
    var validationStatus = <bool>[false, false, false];
    validationStatus[0] = password.length >= 6;
    validationStatus[1] = RegExp(r'(?=.*[A-Z])').hasMatch(password);
    validationStatus[2] = RegExp(r'(?=.*?[0-9])').hasMatch(password);
    return validationStatus;
  }

  /// Show an error snack bar.
  ///
  /// [message] : error message.
  static void showError(String message) {
    closeSnackBar();
    closeDialog();
    closeBottomSheet();
    if (message.isEmpty) return;
    Get.rawSnackbar(
      messageText: Text(
        message,
        style: Styles.white16,
      ),
      mainButton: TextButton(
        onPressed: () {
          if (Get.isSnackbarOpen) {
            Get.back<void>();
          }
        },
        child: Text(
          'Okay',
          style: Styles.white14,
        ),
      ),
      backgroundColor: ColorsValue.primaryColor,
      margin: Dimens.edgeInsets15,
      borderRadius: Dimens.fifteen,
      snackStyle: SnackStyle.FLOATING,
    );
  }

  /// Close any open snack bar.
  static void closeSnackBar() {
    if (Get.isSnackbarOpen) Get.back<void>();
  }

  /// Close any open dialog.
  static void closeDialog() {
    if (Get.isDialogOpen ?? false) Get.back<void>();
  }

  /// Close any open bottom sheet.
  static void closeBottomSheet() {
    if (Get.isBottomSheetOpen ?? false) Get.back<void>();
  }

  static void responseErrorHandle(Object obj){
    switch (obj.runtimeType) {
      case io.DioError:
        final res = (obj as io.DioError).response;
        Utility.showError('${res!.data['message']}');
        Utility.printELog('Got error : ${res.statusCode} -> ${res.data}');
        break;
      default:
        break;
    }
  }

}


extension StringCasingExtension on String {
  String toCapitalized() => length > 0 ?'${this[0].toUpperCase()}${substring(1)}':'';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ').split(" ").map((str) => str.toCapitalized()).join(" ");
}