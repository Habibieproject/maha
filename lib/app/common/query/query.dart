import 'package:flutter/material.dart';
import 'package:maha/app/common/extension/context.dart';
import 'package:maha/app/common/extension/sizedbox.dart';

Widget spaceDoubleBottom() {
  return Column(children: [
    spaceHeight1,
    spaceHeight1,
  ]);
}

//padding
EdgeInsets sizePaddingAll(BuildContext context) {
  return const EdgeInsets.all(16);
}

EdgeInsets sizePadding01(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: context.screenWidth * 0.01);
}

EdgeInsets sizePadding(BuildContext context) {
  return EdgeInsets.symmetric(horizontal: context.screenWidth * 0.05);
}

EdgeInsets sizePaddingvertical01(BuildContext context) {
  return EdgeInsets.symmetric(vertical: context.screenHeight * 0.01);
}

EdgeInsets sizePaddingvertical(BuildContext context) {
  return EdgeInsets.symmetric(vertical: context.screenHeight * 0.05);
}

//spaceside
// Space side
EdgeInsets sizeRight01(BuildContext context) {
  return EdgeInsets.only(right: context.screenWidth * 0.01);
}

EdgeInsets sizeTop01(BuildContext context) {
  return EdgeInsets.only(top: context.screenHeight * 0.01);
}

EdgeInsets sizeLeft01(BuildContext context) {
  return EdgeInsets.only(left: context.screenWidth * 0.01);
}

EdgeInsets sizeBottom01(BuildContext context) {
  return EdgeInsets.only(bottom: context.screenHeight * 0.01);
}

EdgeInsets sizeBottom1(BuildContext context) {
  return EdgeInsets.only(bottom: context.screenHeight * 0.01) * 10;
}

//space01
final spaceHeight01 = 4.height;

final spaceHeight02 = 8.height;

final spaceHeight03 = 12.height;

final spaceHeight04 = 16.height;

final spaceHeight05 = 20.height;

final spaceHeight06 = 24.height;

final spaceHeight07 = 28.height;

final spaceHeight08 = 32.height;

final spaceHeight09 = 36.height;

//space1
final spaceHeight1 = 40.height;

//spacewidth01
final spaceWidth01 = 4.width;

final spaceWidth02 = 8.width;

final spaceWidth03 = 12.width;

final spaceWidth04 = 16.width;

final spaceWidth05 = 20.width;

final spaceWidth06 = 24.width;

final spaceWidth07 = 28.width;

final spaceWidth08 = 32.width;

final spaceWidth09 = 36.width;

//spacewidth1
final spaceWidth1 = 40.width;
