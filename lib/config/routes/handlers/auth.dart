import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:metter/core/auth/login.dart';
import 'package:metter/core/auth/register.dart';

/// Handler for the route: /auth/login/
var loginHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return LoginPage();
  },
);

/// Handler for the route: /auth/register/
var registerHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return RegisterPage();
  },
);
