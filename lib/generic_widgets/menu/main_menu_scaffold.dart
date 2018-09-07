import 'package:flutter/material.dart';
export 'screen.dart';
import 'main_menu.dart';
import 'menu_controller.dart';
import 'screen.dart';
export 'screen.dart';

class MainMenuScaffold extends StatelessWidget {
  final List<Screen> screens;
  MainMenuScaffold({this.screens});

  @override
  Widget build(BuildContext context) {
    return buildScaffold(context);
  }

  Widget buildScaffold(context) {

    menuController.changeActiveScreeen$(screens[0]);

    return StreamBuilder(
      stream: menuController.activeScreen$,
      builder: (BuildContext context, AsyncSnapshot<Screen> snapshot) {
          return Stack(children: <Widget>[
            snapshot.hasData
                ? snapshot.data
                : Center(
                    child: Material(),
                  ),
            MainMenu(
              screens: screens,
            ),
          ]);
      },
    );
  }
}
