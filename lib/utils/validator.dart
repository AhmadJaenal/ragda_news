String? confirmPasswordValidator(String? password, String? confirmPassword) {
  if (password == null ||
      password.isEmpty ||
      confirmPassword == null ||
      confirmPassword.isEmpty) {
    return "Required field, please enter a valid value";
  }

  if (password != confirmPassword) {
    return "Passwords do not match!";
  }

  return null;
}

String? validateNotEmpty(String? value) {
  return value == null || value.trim().isEmpty
      ? "Required field, please enter a valid value"
      : null;
}

bool isValidEmail(String email) {
  final regExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(\.[a-zA-Z]+)+$",
  );
  return regExp.hasMatch(email);
}

String? isValidPassword(String? password) {
  final regExp = RegExp(r"^.{8,}$");

  if (password == null || password.isEmpty) {
    return "Required field, please enter a valid value";
  }

  if (!regExp.hasMatch(password)) {
    return "The password must be 8 characters";
  }

  return null;
}

String? noEmptyEmailValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return "Required field, please enter a valid value";
  }

  if (!isValidEmail(value.trim())) {
    return "Invalid email format";
  }

  return null;
}
