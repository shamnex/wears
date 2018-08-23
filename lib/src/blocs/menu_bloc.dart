import 'package:wears/src/screens/home_screen.dart';

import '../widgets/menu/screen.dart';
import 'dart:async';
import 'package:rxdart/rxdart.dart';

class MenuBloc {
  final _activeScreen$ = BehaviorSubject<Screen>(
    seedValue: Screen(
      title: "HOME",
      body: HomeScreen(),
    ),
  );
  final _menuOpen$ = PublishSubject<bool>();

  //getters
  Stream<Screen> get activeScreen$ => _activeScreen$.stream;
  Stream<bool> get menuOpen$ => _menuOpen$.stream;
  Stream<String> get activeScreenTitle$ => _activeScreen$.stream.map((data) => data.title);
  //setters
  Function(Screen) get changeActiveScreeen$ => _activeScreen$.sink.add;
  Function(bool) get toggleMenu$ => _menuOpen$.sink.add;

  dispose() {
    _activeScreen$.close();
    _menuOpen$.close();
  }
}
