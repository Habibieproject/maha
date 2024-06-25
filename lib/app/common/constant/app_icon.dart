import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget iconSVGMethod(String iconSVG) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: SvgPicture.asset(iconSVG),
  );
}

class AppIcon {
  static const String _basePath = 'assets/images/icons';
  static String _imagePath(String fileName) => '$_basePath/$fileName';

//Icon bottomNavigator
  static const IconData kIconHome = Icons.home;
  static const IconData kIconExplore = Icons.explore;
  static const IconData kIconPesanan = Icons.message;
  static const IconData kIconSimpan = Icons.save;
  static const IconData kIconProfil = Icons.person;

  //Icons
  static final passwordSVG = _imagePath('password.svg');
  static final emailSVG = _imagePath('email.svg');
  static final visibilityOn = _imagePath('visibility_on.svg');
  static final visibilityOff = _imagePath('visibility_off.svg');
}
