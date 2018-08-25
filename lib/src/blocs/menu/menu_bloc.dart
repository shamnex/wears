import 'dart:async';
import 'package:flutter/animation.dart';
import 'package:rxdart/rxdart.dart';

import '../../widgets/menu/screen.dart';
import '../../screens/home_screen.dart';

class MenuBloc {
  final _activeScreen$ = BehaviorSubject<Screen>(
    seedValue: Screen(
      title: "HOME",
      body: HomeScreen(),
    ),
  );

  final _ismenuOpen$ = BehaviorSubject<bool>();
  final _animationStatus$ =
      BehaviorSubject<AnimationStatus>();

  //getters
  Stream<Screen> get activeScreen$ => _activeScreen$.stream;
  Stream<String> get activeScreenTitle$ =>
      _activeScreen$.stream.map((data) => data.title);
  // Stream<bool> get isMenuAnimating$ =>
  //     _animationStatus$.stream.transform(waitForAnimation);
  Stream<bool> get ismenuOpen$ =>
      _ismenuOpen$.stream.distinct().throttle(Duration(milliseconds: 0));



  final waitForAnimation =
      StreamTransformer<AnimationStatus, bool>.fromHandlers(
          handleData: (status, sink) {
    if (status == AnimationStatus.forward ||
        status == AnimationStatus.reverse) {
      // print("menu is animating");
      return sink.addError(false);
    }
    // print("menu is NOT ANIMATING");
    sink.add(true);
  });

  //setters
  Function(Screen) get changeActiveScreeen$ => _activeScreen$.sink.add;
  Function(bool) get toggleMenu$ {
    print(_animationStatus$.value);
    return _ismenuOpen$.sink.add;
  }

  Function(AnimationStatus) get changeAnimationStatus$ {
    return _animationStatus$.sink.add;
  }

  dispose() {
    _activeScreen$.close();
    _ismenuOpen$.close();
    _animationStatus$.close();
  }
}
