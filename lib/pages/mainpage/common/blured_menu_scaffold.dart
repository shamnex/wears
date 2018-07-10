import 'dart:async';
import 'package:flutter/material.dart';
import 'blured_menu.dart';
import 'screen.dart';

class BluredMenuScaffold extends StatefulWidget {
  final Screen screen;
  BluredMenuScaffold({this.screen});
  @override
  BluredMenuScaffoldState createState() => new BluredMenuScaffoldState();
}

class BluredMenuScaffoldState extends State<BluredMenuScaffold>
    with TickerProviderStateMixin {
  MenuController menuController;
  @override
  void initState() {
    super.initState();
    menuController = new MenuController(
      vsync: this,
    )..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(children: <Widget>[
        buildScreen(widget.screen, context, menuController),
        new BluredMenu(menuController)
      ]),
    );
  }
}

class MenuController extends ChangeNotifier {
  final TickerProvider vsync;
  final AnimationController _animationController;
  MenuState state = MenuState.closed;
  bool isOpen;

  MenuController({this.vsync})
      : _animationController = new AnimationController(vsync: vsync) {
    _animationController
      ..duration = const Duration(milliseconds: 400)
      ..addListener(() {
        notifyListeners();
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
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

  get blurAnimation {
    return _animationController.value;
  }

  double get noAnimation {
    return isOpen == true ? 1.0 : 0.0;
  }

  open() {
    _animationController.forward();
    isOpen = true;
  }

  close() {
    _animationController.reverse();
    new Timer(const Duration(milliseconds: 350), () {
      isOpen = false;
    });
  }

  toggle() {
    state == MenuState.open ? close() : open();
  }
}

enum MenuState { closed, opening, open, closing }
