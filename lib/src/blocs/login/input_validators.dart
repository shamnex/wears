import 'dart:async';

class Validators {
  final validateUsername = StreamTransformer<String, String>.fromHandlers(
      handleData: (username, sink) {
    if (username.isEmpty) return sink.addError("User Name is empty");
    if (!_isEmail(username)) return sink.addError("Invalid Email");
    sink.add(username);
  });

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.isEmpty) return sink.addError("Password is empty");
    if (password.length < 4) return sink.addError("Password must be more than 4 characters");

    sink.add(password);
  });

  static bool _isEmail(String email) {
    String expression =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(expression);
    return regExp.hasMatch(email);
  }
}
