import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'input_validators.dart';

class LoginBloc extends Object with Validators {
  final _username$ = BehaviorSubject<String>();
  final _password$ = BehaviorSubject<String>();

  //add data to stream
  Stream<String> get username$ =>
      _username$.stream.delay(Duration(milliseconds: 1500)).transform(validateUsername);

  Stream<String> get password$ => _password$.stream
    .delay(Duration(milliseconds: 1500)).transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(username$, password$, (e, p) => true);
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
