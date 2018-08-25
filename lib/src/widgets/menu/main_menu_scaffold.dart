import 'package:flutter/material.dart';
import '../../screens/home_screen.dart';
import 'main_menu.dart';
import 'screen.dart';
import '../../blocs/menu/menu_bloc.dart';
import '../../blocs/menu/menu_provider.dart';

class MainMenuScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MenuBloc bloc = MenuProvider.of(context);
    return StreamBuilder(
      stream: bloc.activeScreen$,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        return Material(
          child: Stack(children: <Widget>[
            snapshot.hasData
                ? snapshot.data
                : Center(
                    child: Text("Loading"),
                  ),
            MainMenu(bloc),
          ]),
        );
      },
    );
  }
}
