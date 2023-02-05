import 'package:flutter/widgets.dart';

class AppColors {
  const AppColors._();

  static const Color background = Color.fromRGBO(0, 0, 0, 1);
  static const Color snowWhite = Color.fromRGBO(255, 250, 250, 1.0);
  static const Color lime = Color.fromRGBO(0, 255, 0, 0.8);
  static const Color blue = Color.fromRGBO(0, 0, 255, 1.0);
  static const Color goldenrod = Color.fromRGBO(218, 165, 32, 0.9);
  static const Color indigo = Color.fromRGBO(75, 0, 130, 0.7);
  static const Color springGreen  = Color.fromRGBO(0, 255, 127, 0.5);
  static const Color lightSlateGray  = Color.fromRGBO(119, 136, 153, 0.9);
  static const Color gold  = Color.fromRGBO(255, 215, 0, 0.9);
  static const LinearGradient gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color.fromRGBO(240, 230, 140, 1.0),
      Color.fromRGBO(220, 20, 60, 1.0),
    ],
  );
}
