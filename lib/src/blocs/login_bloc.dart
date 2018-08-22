import 'dart:async';

class LoginBloc extends Object with Validators {
  final _email$ = StreamController();
  final _password$ = StreamController();

  //add data to stream
  Stream<String> get email$ => _email$.stream.transform(validateEmail);
  Stream<String> get password$ => _password$.stream.transform(validatePassword);

  //change Data
  Function(String) get changeEmail => _email$.sink.add;
  Function(String) get changePassword => _email$.sink.add;

  dispose() {
    _email$.close();
    _password$.close();
  }
}

class Validators {
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("invalid email");
    }
  });
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError("invalid password");
    }
  });
}
