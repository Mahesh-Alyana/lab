import 'package:flutter/material.dart';

/// A chunks of colors used
/// in the application
abstract class ColorsValue {

  static const MaterialColor primaryColorSwatch =  MaterialColor(
    0xffAA2D29, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color.fromRGBO(24, 188, 56, .1),
      100: Color.fromRGBO(24, 188, 56, .2),
      200: Color.fromRGBO(24, 188, 56, .3),
      300: Color.fromRGBO(24, 188, 56, .4),
      400: Color.fromRGBO(24, 188, 56, .5),
      500: Color.fromRGBO(24, 188, 56, .6),
      600: Color.fromRGBO(24, 188, 56, .7),
      700: Color.fromRGBO(24, 188, 56, .8),
      800: Color.fromRGBO(24, 188, 56, .9),
      900: Color.fromRGBO(24, 188, 56, 1.0),
    },
  );

  static const Color primaryColor = Color(tealHex);
  static const Color primaryColorLight = Color(lightTealHex);
  static const Color darkBlue = Color(darkBlueHex);

  static const int primaryColorHex = 0xFF503E9D;
  static const int lightPinkHex = 0xffD47FA6;
  static const int lightGreyHex = 0xffF1F0F2;
  static const int darkBlueHex = 0xff2b3b53;
  static const int lightTealHex = 0xFF6DC0BC;
  static const int tealHex = 0xFF18bc9c;
}
