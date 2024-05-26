final class Validator {
  Validator._();
  static bool isValidEmail(String email) {
    final RegExp emailRegExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    );

    return emailRegExp.hasMatch(email);
  }

  static bool isValidPassword(String password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
    );
    return passwordRegExp.hasMatch(password);
  }

  static bool isContainsNumber(String password) {
    final RegExp regExp = RegExp(r'\d');
    return regExp.hasMatch(password);
  }

  static bool isContainsBothRegisters(String password) {
    final RegExp regExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])');
    return regExp.hasMatch(password);
  }

  static bool isCorrectLength(String password) {
    final RegExp regExp = RegExp(r'^(?!.*\s).{8,64}$');
    return regExp.hasMatch(password);
  }
}
