import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double get screenHeight => screenSize.height;
  double get screenWidth => screenSize.width;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  NavigatorState get navigator => Navigator.of(this);
}
