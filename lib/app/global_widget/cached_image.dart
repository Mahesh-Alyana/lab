import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String imageUrl;

  const CachedImage({Key? key,required this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: double.infinity,
      // width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => Container(
          // height: double.infinity,
          // width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/img/logo.png'), fit: BoxFit.cover)),
        ),
        errorWidget: (context, url, dynamic error) => const Icon(Icons.error),
      ),
    );
  }
}
