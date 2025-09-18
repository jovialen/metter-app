import 'package:flutter/material.dart';
import 'package:metter/config/routes/handlers/helpers/handlers.dart';
import 'package:metter/pages/home_page.dart';

/// Handler for the route: /
var rootHandler = AuthHandler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
    return HomePage();
  },
);
