String? emailValidator(String? email) {
  const pattern =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  final regex = RegExp(pattern);

  if (email == null || email.isEmpty) {
    return "No email provided";
  }

  final bool emailValid = regex.hasMatch(email);
  if (!emailValid) {
    return "Not a valid email";
  }

  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.isEmpty) {
    return "No password provided";
  }

  if (password.length < 8) {
    return "Password must be at least 8 characters long";
  }

  if (!password.contains(RegExp(r'[A-Z]'))) {
    return "Password must have at least one uppercase letter";
  }

  if (!password.contains(RegExp(r'[a-z]'))) {
    return "Password must have at least one lowercase letter";
  }

  return null;
}
