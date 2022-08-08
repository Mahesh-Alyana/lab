import 'package:dump/app/modules/web_view/web_view_controller.dart';
import 'package:get/get.dart';

class WebViewBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<PdfWebViewController>(() => PdfWebViewController());
  }

}