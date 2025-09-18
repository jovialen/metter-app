import 'package:fluro/fluro.dart';
import 'package:metter/config/routes/handlers/auth.dart';
import 'package:metter/config/routes/handlers/root.dart';

/// Constants for the routes used in the Metter app
class Routes {
  static String root = "/";

  // Authentication
  static String login = "${root}login/";
  static String register = "${root}register/";

  /// Configure a router with the Metter routes
  static void configureRoutes(FluroRouter router) {
    // Root routes
    router.define(root, handler: rootHandler);

    // Authentication routes
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
  }
}
