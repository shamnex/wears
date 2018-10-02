import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class WearsTabBar extends StatefulWidget {
  final List<WearsTabBarView> items;
  final FloatingActionButton fab;
  WearsTabBar({@required this.items, this.fab});

  @override
  State<StatefulWidget> createState() {
    return new WearsTabBarState();
  }
}

class WearsTabBarState extends State<WearsTabBar> {
  int _currentScreenIndex = 0;
  Widget _currentScreen;

  @override
  initState() {
    changeScreen(_currentScreenIndex);
    super.initState();
  }

  changeScreen(int index) {
    _currentScreenIndex = index;
    _currentScreen = widget.items[_currentScreenIndex].screen;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: widget.fab,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // appBar: buildAppBar(context),
      backgroundColor: WearsColors.background,
      body: Scaffold(
        backgroundColor:  WearsColors.background,
          // appBar: AppBar(
          //   backgroundColor: WearsColors.background,
          //   elevation: 0.0,
          // ),
          body: _currentScreen),
      bottomNavigationBar: buildBottomNavigation(),
    );
  }

  Widget buildBottomNavigation() {
    return BottomAppBar(
      notchMargin: 8.0,
      shape: CircularNotchedRectangle(),
      elevation: 0.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 25.0, right: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buildItemList(widget.items).sublist(0, 2).toList(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 60.0, right: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: buildItemList(widget.items).sublist(2).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildItemList(List<WearsTabBarView> items) {
    final List<Widget> _ = [];
    items.asMap().forEach(
          (index, item) => _.add(
                WearsTabBarButton(
                  name: item.name,
                  color: _currentScreenIndex == index
                      ? WearsColors.primary
                      : WearsColors.background,
                  iconImageLink: item.iconImageLink,
                  onPressed: () {
                    setState(() {
                      changeScreen(index);
                    });
                  },
                ),
              ),
        );

    return _;
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1.0,
      elevation: .0,
      backgroundColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        child: Text(
          "Home",
          style: TextStyle(
              fontFamily: 'Antonio',
              fontWeight: FontWeight.w900,
              fontSize: 22.0,
              color: WearsColors.primary),
        ),
      ),
    );
  }
}

class WearsTabBarView {
  final Widget screen;
  final String name;
  final String iconImageLink;
  WearsTabBarView(
      {@required this.screen, @required this.name, this.iconImageLink});
}

class WearsTabBarButton extends StatelessWidget {
  final String name;
  final String iconImageLink;
  final VoidCallback onPressed;
  final Color color;

  WearsTabBarButton(
      {@required this.name,
      @required this.iconImageLink,
      this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 60.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              iconImageLink,
              color: color,
              height: 26.0,
            ),
            Text(
              name.toUpperCase(),
              style: TextStyle(
                fontSize: 10.0,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
