import 'package:flutter/material.dart';
import 'login_bloc.dart';

class LoginProvider extends InheritedWidget {
  LoginProvider({Key key, Widget child}) : super(key: key, child: child);

  updateShouldNotify(Widget oldWidget) {
    return true;
  }

  final bloc = LoginBloc();

  static LoginBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(LoginProvider)
            as LoginProvider).bloc;
  }
}
