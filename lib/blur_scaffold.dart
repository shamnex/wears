import 'package:flutter/material.dart';
import 'package:wears/pages/menu.dart';
import 'constants.dart';

class BlurScaffold extends StatefulWidget {
  final Screen screen;
  final Widget menu;
  BlurScaffold({this.screen, this.menu});

  @override
  BlurScaffoldState createState()=> new BlurScaffoldState();
}


class BlurScaffoldState extends State<BlurScaffold> {
  MenuController menuController;
  @override
  void initState() {
    super.initState();

    menuController = new MenuController()
    ..addListener(() => setState((){

    }));

  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
           createScreen(widget.screen, context), 
           new BluredMenu(),
           ],
      ),
    );
  }
}

class Screen {
  final String title;
  final WidgetBuilder contenBuilder;

  Screen(
    {this.title, this.contenBuilder
  });
}

createScreen(Screen activeScreen, BuildContext context) {
  return new Scaffold(
    backgroundColor: AppColors.background,
    appBar: new AppBar(
      leading: new IconButton(
        onPressed: () {           

        },
        icon: new ImageIcon(
          new AssetImage("assets/icons/menu.png"),
          size: 30.0,
          color: AppColors.primary,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: new Center(
        child: new Padding(
          padding: const EdgeInsets.only(right: 55.0),
          child: new Text(
           activeScreen.title,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: AppColors.primary),
          ),
        ),
      ),
    ),
    body: activeScreen.contenBuilder(context),
  );
}

class MenuController extends ChangeNotifier {
  MenuState state = MenuState.closed;
  double percentOpen = 0.0;
  double percentClose = 1.0;

  open() {
    state = MenuState.open;
    percentOpen = 1.0;
    notifyListeners();
  }

  close() {
    state = MenuState.closed;
    percentClose = 0.0;
    notifyListeners();
  }

  toggle() {
    state == MenuState.open?close():open();
  }

}

enum MenuState {
  closed,
  opening,
  open,
  closing
}
