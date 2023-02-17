import 'package:flutter/material.dart';

String uri = 'https://limav2.mhealthkenya.org';

class GlobalVariables {
// COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 19, 116, 22),
      Color.fromARGB(255, 34, 136, 55),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}
