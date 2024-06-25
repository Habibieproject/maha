import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:maha/app/views/auth/auth_screen.dart';
import 'package:maha/app/views/main_menu/main_screen.dart';
import 'package:maha/app/views/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class RouterGenerator {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: SplashScreen.id,
        name: SplashScreen.id,
        pageBuilder: (context, state) => _createPageTransitionPage(
          const SplashScreen(),
          state,
        ),
      ),
      GoRoute(
        path: AuthScreen.id,
        name: AuthScreen.id,
        pageBuilder: (context, state) => _createPageTransitionPage(
          const AuthScreen(),
          state,
        ),
      ),
      GoRoute(
        path: MainScreen.id,
        name: MainScreen.id,
        pageBuilder: (context, state) => _createPageTransitionPage(
          const MainScreen(),
          state,
        ),
      ),
    ],
    errorPageBuilder: (context, state) => _createPageTransitionPage(
      const SplashScreen(),
      state,
    ),
  );

  static PageTransitionPage _createPageTransitionPage(
      Widget child, GoRouterState state) {
    final transitionType = _getTransitionType(state.name);
    return PageTransitionPage(
      child: child,
      type: transitionType,
      key: state.pageKey,
      name: state.name,
    );
  }

  static PageTransitionType _getTransitionType(String? routeName) {
    switch (routeName) {
      default:
        return PageTransitionType.rightToLeft;
    }
  }
}

class PageTransitionPage<T> extends Page<T> {
  final Widget child;
  final PageTransitionType type;

  const PageTransitionPage({
    required this.child,
    required this.type,
    super.key,
    super.name,
    super.arguments,
  });

  @override
  Route<T> createRoute(BuildContext context) {
    return PageTransition<T>(
      child: child,
      type: type,
      settings: this,
    );
  }
}
