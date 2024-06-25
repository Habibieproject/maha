import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension NavigationExtension on BuildContext {
  void navigateTo(String routeName) {
    GoRouter.of(this).go(routeName);
  }

  void navigateToNamed(
    String name,
  ) {
    GoRouter.of(this).goNamed(
      name,
    );
  }

  void pushTo(String routeName) {
    GoRouter.of(this).push(routeName);
  }

  void pushToNamed(
    String name,
  ) {
    GoRouter.of(this).pushNamed(
      name,
    );
  }
}
