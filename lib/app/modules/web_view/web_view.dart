import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/web_view/web_view_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfWebView extends StatelessWidget {
  const PdfWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PdfWebViewController>(
      builder: (logic) {
        return SizedBox(
          height: Dimens.screenHeight,
          width: Dimens.screenWidth,
          child: Column(
            children: [
              Dimens.boxHeight20,
              Expanded(
                child: SfPdfViewer.network(
                  logic.url,
                  key: logic.pdfViewerKey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PrimaryButton(onPress: Get.back,text: 'Back',),
              ),
              Dimens.boxHeight40,
            ],
          ),
        );
      }
    );
  }
}
