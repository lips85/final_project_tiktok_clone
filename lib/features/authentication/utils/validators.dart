class Validators {
  static final regEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  static final regPassword = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );

  static String? validateEmail(String email) {
    if (email.isEmpty) return null;
    if (!regEmail.hasMatch(email)) {
      return "Email not valid";
    }
    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) return null;
    if (!regPassword.hasMatch(password)) {
      return "Password not valid";
    }
    return null;
  }

  static String? confirmPassword(String password, String confirmPassword) {
    if (confirmPassword.isNotEmpty) {
      if (password == confirmPassword) {
        return null;
      }
      return "Password is not matched";
    }
    return null;
  }

  static bool isFormValid(
    String email,
    String password,
    String confirmPassword,
  ) {
    return password == confirmPassword &&
        Validators.regEmail.hasMatch(email) &&
        Validators.regPassword.hasMatch(password);
  }
}
