import 'package:flutter/material.dart';
import 'constants.dart';
import 'pages/menu.dart';

class BlurScaffold extends StatefulWidget {
  final Screen screen;
  BlurScaffold({this.screen});
  @override
  BlurScaffoldState createState()=> new BlurScaffoldState();
}


class BlurScaffoldState extends State<BlurScaffold> with TickerProviderStateMixin {
  MenuController menuController;
  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )
    ..addListener(()=> setState(() {}));
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
           createScreen(widget.screen, context, menuController), 
           menuController.isOpen? new BluredMenu(menuController): new Container(),
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

createScreen(Screen activeScreen, BuildContext context, MenuController menuController) {
  return new Scaffold(
    backgroundColor: AppColors.background,
    appBar: new AppBar(
      leading: new IconButton(
        onPressed: () {           
          menuController.toggle();
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
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;
  bool isOpen = false;

  

  MenuController({
    this.vsync
  }):_animationController = new AnimationController(vsync: vsync) {
    _animationController
    ..duration = const Duration(milliseconds: 250)
    ..addListener((){
      notifyListeners();
    })
    ..addStatusListener((AnimationStatus status) {
      switch(status) {
        case AnimationStatus.forward:
        state = MenuState.opening;
        break;
        case AnimationStatus.reverse:
        state = MenuState.closing;
        break;
        case AnimationStatus.completed:
        state = MenuState.open;
        break;
        case AnimationStatus.dismissed:
        state = MenuState.closed;
        break;
      }
      notifyListeners();
    });
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  get blur {
    return _animationController.value;
  }

  open() {
    isOpen = true;
    _animationController.forward();
  }

  close() {
     isOpen = true;
    _animationController.reverse();

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

