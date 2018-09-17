import 'package:flutter/animation.dart';
import 'package:rxdart/rxdart.dart';

import 'screen.dart';

class MenuController {
  final _activeScreen$ = BehaviorSubject<BluredMenuScreen>();
  final _ismenuOpen$ = BehaviorSubject<bool>(seedValue: false);
  final _animationStatus$ = BehaviorSubject<AnimationStatus>();

  //getters
  Observable<BluredMenuScreen> get activeScreen$ => _activeScreen$.stream.throttle(Duration(milliseconds:300)).distinct();

  Observable<String> get activeScreenTitle$ =>
      _activeScreen$.stream.map((data) => data.title);
  Observable<bool> get ismenuOpen$ => _ismenuOpen$.stream.distinct();

  Observable<AnimationStatus> get animationStatus$ => _animationStatus$.stream;

  bool get isAnimating {
    switch (_animationStatus$.value) {
      case AnimationStatus.completed:
        return false;
        break;
      case AnimationStatus.forward:
        return true;
        break;
      case AnimationStatus.reverse:
        return true;
        break;
      case AnimationStatus.completed:
        return false;
      default:
        return false;
    }
  }

  //setters
  Function(BluredMenuScreen) get changeActiveScreeen$ => _activeScreen$.sink.add;

  Function(AnimationStatus) get changeAnimationStatus$ =>
      _animationStatus$.sink.add;

  void get toggleMenu$ => isAnimating ? null : _ismenuOpen$.sink.add(!_ismenuOpen$.value);
  void get openMenu$ => isAnimating ? null : _ismenuOpen$.sink.add(true);
  get closeMenu$ => isAnimating ? null : _ismenuOpen$.sink.add(false);

  dispose() {
    _activeScreen$.close();
    _ismenuOpen$.close();
    _animationStatus$.close();
  }
}

final menuController = MenuController();
