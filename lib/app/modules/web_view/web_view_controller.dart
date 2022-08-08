import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'dart:io';


class PdfWebViewController extends GetxController{
  String url = Get.arguments as String;
  final GlobalKey<SfPdfViewerState> pdfViewerKey = GlobalKey();

}