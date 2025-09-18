import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:metter/core/auth/auth.dart';

/// Route handler for routes that require user authentication.
// ignore: non_constant_identifier_names
Handler AuthHandler({
  HandlerType type = HandlerType.route,
  required Widget? Function(BuildContext?, Map<String, List<String>>)
  handlerFunc,
}) {
  return Handler(
    type: type,
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      // Check if the user has been authenticated
      if (FirebaseAuth.instance.currentUser == null) {
        // If not, redirect to authentication
        return AuthPage();
      }

      // Otherwise, continue as usual
      return handlerFunc(context, params);
    },
  );
}
