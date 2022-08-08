import 'package:dump/app/data/service/common_services.dart';
import 'package:dump/app/data/service/socket_io_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:get/get.dart';
import 'package:dump/app/routes/app_pages.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:get_storage/get_storage.dart';

/// Main entry of the application
void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    await initServices();
    // await disableCapture();
    runApp(const MyApp());
  } catch (error) {
    Utility.printELog(error.toString());
  }
}

bool isLogin = false;

Future<void> disableCapture() async {
  //disable screenshots and record screen in current screen
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

/// Initialize the services before the app starts.
Future<void> initServices() async {
  Get.config(enableLog: true, defaultPopGesture: true);
  await GetStorage.init();
  Get.put(CommonService(), permanent: true);
  Get.put(SocketIoService(), permanent: true);
  // await Get.find<CommonService>().box.remove('token');
  await Get.find<CommonService>().readToken().then((value) {
    isLogin = '$value'.isEmpty ? false : true;
  });
}

/// A class to create the initial structure of the
/// application and adds routes in the application
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      designSize: const Size(375, 745),
      builder: (_) => GetMaterialApp(
          title: 'Dump',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          getPages: AppPages.pages,
          initialRoute: isLogin ? AppRoutes.home : AppRoutes.landing));
}
