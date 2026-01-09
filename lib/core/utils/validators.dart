/// Returns true if the [email] is in a valid format.
bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

/// Returns true if the [password] is valid (example: minimum 6 characters)
bool isValidPassword(String password) {
  return password.length >= 6;
}
