import 'package:dump/app/theme/theme.dart';
import 'package:flutter/material.dart';

/// A no internet widget which will be shown if network connection is not
/// available.
class NoInternetWidget extends StatelessWidget {
  const NoInternetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.black12,
    body: Padding(
      padding: Dimens.edgeInsets15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Internet',
            textAlign: TextAlign.center,
            style: Styles.boldWhite23,
          ),
        ],
      ),
    ),
  );
}