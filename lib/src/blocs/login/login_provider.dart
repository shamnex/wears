import 'package:flutter/material.dart';
import 'login_bloc.dart';

class LoginProvider extends InheritedWidget {
  updateShouldNotify(_) => true;
  LoginProvider({Key key, Widget child}) : super(key: key, child: child);

  final bloc =  LoginBloc();

  static LoginBloc of(context)  {
    return (context.inheritFromWidgetOfExactType(LoginProvider) as LoginProvider).bloc;
  }
}
