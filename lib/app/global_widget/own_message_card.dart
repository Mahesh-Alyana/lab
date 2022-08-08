import 'package:any_link_preview/any_link_preview.dart';
import 'package:dump/app/global_widget/cached_image.dart';
import 'package:dump/app/routes/routes_management.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:dump/app/utils/utility.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_viewer/image_viewer.dart';

class OwnMessageCard extends StatelessWidget {
  const OwnMessageCard(
      {Key? key, required this.message, required this.time, required this.type})
      : super(key: key);
  final String message;
  final String time;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: 50,
          maxWidth: MediaQuery.of(context).size.width - 45,
        ),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xffdcf8c6),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 5,
                  bottom: 20,
                ),
                child: type == 'text'
                    ? Text(
                        message,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      )
                    : Utility.checkUrlIsImage(message)
                        ? InkWell(
                            onTap: () {
                              ImageViewer.showImageSlider(
                                images: [message],
                                startingPosition: 1,
                              );
                            },
                            child: CachedImage(imageUrl: message))
                        : Utility.checkUrlIsPed(message)
                            ? InkWell(
                                onTap: () {
                                  RoutesManagement.goToPdfWebView(message);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.folder_fill,
                                        color: ColorsValue.darkBlue,
                                        size: Dimens.fifty,
                                      ),
                                      Dimens.boxWidth10,
                                      Column(
                                        children: [
                                          Text(
                                            message.split('/').last.length < 12
                                                ? message.split('/').last
                                                : '${message.split('/').last.substring(0, 12).split('.')[0]}.pdf',
                                            style: Styles.black18,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : AnyLinkPreview(link: message),
              ),
              Positioned(
                bottom: 4,
                right: 10,
                child: Row(
                  children: [
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.done_all,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
