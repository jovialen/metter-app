import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metter/config/routes/config.dart';
import 'package:metter/core/auth/auth.dart';
import 'package:metter/core/auth/login.dart';
import 'package:metter/core/auth/register.dart';
import 'package:metter/pages/home_page.dart';

/// Global router for the Metter app
class MetterRouter {
  /// Global router
  static final GoRouter router = GoRouter(
    initialLocation: FirebaseAuth.instance.currentUser != null
        ? Routes.home
        : Routes.auth,
    redirect: (BuildContext context, GoRouterState state) {
      bool loggingIn = state.matchedLocation.contains(Routes.auth);
      bool loggedIn = FirebaseAuth.instance.currentUser != null;

      if (!loggedIn && !loggingIn) return Routes.auth;
      if (loggedIn && loggingIn) return Routes.home;
      return null;
    },
    routes: [
      GoRoute(path: Routes.home, builder: (_, __) => HomePage()),

      GoRoute(path: Routes.auth, builder: (_, __) => AuthPage()),
      GoRoute(path: Routes.login, builder: (_, __) => LoginPage()),
      GoRoute(path: Routes.register, builder: (_, __) => RegisterPage()),
    ],
  );
}
