/// Constants for the routes used in the Metter app
class Routes {
  static final String _root = "/";
  static String home = _root;

  // Authentication
  static String auth = "${home}auth";
  static String login = "$auth/login";
  static String register = "$auth/register";
}
