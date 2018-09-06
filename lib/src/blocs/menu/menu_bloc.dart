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

  final _ismenuOpen$ = BehaviorSubject<bool>(seedValue: false);
  final _animationStatus$ = BehaviorSubject<AnimationStatus>();

  //getters
  Stream<Screen> get activeScreen$ =>
      _activeScreen$.stream
      .distinct()
      .throttle(Duration(milliseconds: 200));

  Stream<String> get activeScreenTitle$ =>
      _activeScreen$.stream
      .map((data) => data.title);

  Stream<bool> get ismenuOpen$ =>
      _ismenuOpen$.stream
      .distinct()
      .throttle(Duration(milliseconds: 200));

  final waitForAnimation =
      StreamTransformer<AnimationStatus, bool>.fromHandlers(
          handleData: (status, sink) {
    if (status == AnimationStatus.forward ||
        status == AnimationStatus.reverse) {
      return sink.addError(false);
    }
    sink.add(true);
  });

  //setters
  Function(Screen) get changeActiveScreeen$ => _activeScreen$.sink.add;
  void get toggleMenu$ =>  _ismenuOpen$.sink.add(!_ismenuOpen$.value);
  void get closeMenu$ =>  _ismenuOpen$.sink.add(false);
  void get openMenu$ =>  _ismenuOpen$.sink.add(true);
  
  Function(AnimationStatus) get changeAnimationStatus$ {
    return _animationStatus$.sink.add;
  }

  dispose() {
    _activeScreen$.close();
    _ismenuOpen$.close();
    _animationStatus$.close();
  }
}
