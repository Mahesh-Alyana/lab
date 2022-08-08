import 'dart:io';

import 'package:dump/app/global_widget/primary_button.dart';
import 'package:dump/app/modules/chat_room/chat_room_controller.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PreViewImageAndSend extends StatelessWidget {
  const PreViewImageAndSend({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatRoomController>(
      builder: (logic) {
        return Container(
          height: Dimens.screenHeight,
          width: Dimens.screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Dimens.boxHeight40,
              Expanded(
                  child: SizedBox(
                height: Dimens.screenWidth,
                child: Utility.checkUrlIsPed(logic.imagePath)
                    ? PDFView(
                  filePath: logic.imagePath,
                  enableSwipe: true,
                  swipeHorizontal: true,
                  autoSpacing: false,
                  pageFling: false,
                  onRender: (_pages) {
                  },
                  onError: (error) {
                    print(error.toString());
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                  },
                )
                    : Image.file(File(logic.imagePath),fit: BoxFit.fill,),
              )),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 20,top: 8),
                child: PrimaryButton(onPress: (){
                  logic.sendImageMessage(logic.imagePath);
                },text: 'Send',),
              )

            ],
          ),
        );
      }
    );
  }
}
