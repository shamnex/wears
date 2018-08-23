import 'package:flutter/material.dart';
import 'menu_bloc.dart';

class MenuProvider extends InheritedWidget {
  updateShouldNotify(_) => true;

  MenuProvider({Key key, Widget child}) : super(key: key, child: child);

  final bloc = MenuBloc();

  static MenuBloc of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(MenuProvider) as MenuProvider)
        .bloc;
  }
}
