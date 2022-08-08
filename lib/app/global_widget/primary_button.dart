import 'package:flutter/material.dart';
import 'package:dump/app/theme/theme.dart';


/// This class create a Button which used as a primary button through out the app
/// Create a filled button.
///
/// The [onPress] & [text] argument must not be null.

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({Key? key,this.onPress, this.text}) : super(key: key);
  final VoidCallback? onPress;
  final String? text;

  @override
  Widget build(BuildContext context) =>Container(
    constraints: const BoxConstraints(
        maxWidth: 500
    ),
    child: RaisedButton(
          onPressed: onPress,
          color: ColorsValue.primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                  Radius.circular(5))
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: <Widget>[
                Text(text!,
                  style: const TextStyle(color: Colors.white),),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(20)),
                    color: ColorsValue.primaryColorLight,
                  ),
                  child: const Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 16,),
                )
              ],
            ),
          ),
        ));
}
