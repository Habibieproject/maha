import 'package:flutter/material.dart';

class AppColor {
  // Primary Palette
  static const Color kPrimaryColor = Color(0xFFec1e23);
  static const Color kSecondaryColor = Color(0xFF34BBF4);

  // Grey Shades
  static const Color kGreyMosColor = Color(0xFFD9D9D9);
  static const Color kGreyMosLightColor = Color(0xFFEFF3F5);
  static const Color kGreyTextColor = Color(0xFF686868);
  static const Color kGreyColor = Colors.grey;

  // Text Colors
  static const Color kBlackTextColor = Color(0xFF231f20);
  static const Color kBlackMosColor = Color(0xFF0E0F0F);

  // Status Colors
  static const Color kGreenMosColor = Color(0xFF2BA118);
  static const Color kRedMosColor = Color(0xFFBD1730);
  static const Color kOrangeMosColor = Color(0xFFF95A0B);
  static const Color kOrangeMosWaitTranferColor = Color(0xFFF76535);
  static const Color kOrangeMosFollowColor = Color(0xFFfd7e14);
  static const Color kGreenColor = Colors.green;
  static const Color kRedColor = Colors.red;

  // Basic Colors
  static const Color kBlackColor = Colors.black;
  static const Color kWhiteColor = Colors.white;

  // Special Cases
  static const Color kTransparentColor = Colors.transparent;
  static const Color kTransparentColorEdit = Color.fromARGB(100, 22, 44, 33);
}

Color getBackgroundColor(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark
      ? AppColor.kBlackColor
      : AppColor.kWhiteColor;
}

Color getBackgroundColorMain(BuildContext context) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.dark
      ? AppColor.kBlackMosColor
      : AppColor.kWhiteColor;
}
