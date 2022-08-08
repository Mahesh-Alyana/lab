import 'package:cached_network_image/cached_network_image.dart';
import 'package:dump/app/global_widget/cached_image.dart';
import 'package:dump/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:image_viewer/image_viewer.dart';

class ImageTile extends StatelessWidget {
  const ImageTile({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        ImageViewer.showImageSlider(
          images: [url],
          startingPosition: 1,
        );
      },
      child: Card(
        child: ListTile(
          leading: SizedBox(
            height: double.infinity,
            width: Dimens.fifty,
            child:  CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: url,
              placeholder: (context, url) => Container(
                // height: double.infinity,
                // width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover)),
              ),
              errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
            ),
          ),
          title: Text('Image',style: Styles.black18,),
        ),
      ),
    );
  }
}
