import 'dart:async';
import 'package:wears/src/blocs/bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:wears/src/utils/input_validators.dart';

class LoginBloc extends BlocBase with Validators {
  final _username$ = BehaviorSubject<String>();
  final _password$ = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get username$ => _username$.stream
      .delay(Duration(milliseconds: 1500))
      .transform(validateUsername);

  Stream<String> get password$ => _password$.stream
      .delay(Duration(milliseconds: 1500))
      .transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(username$, password$, (e, p) {
        return true;
      });
  //change Data
  Function(String) get changeUsername$ => _username$.sink.add;
  Function(String) get changePassword$ => _password$.sink.add;

  submit() {
    final validEmail = _username$.value;
    final validPassword = _password$.value;

    print(validEmail);
    print(validPassword);
  }

  dispose() {
    _username$.close();
    _password$.close();
  }

}




















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
