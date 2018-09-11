import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import '../category_links.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    // return buildHome3(context);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        clipBehavior: Clip.antiAlias,
        backgroundColor: Colors.white,
        child: Image.asset(AppIcons.logoIcon),
        onPressed: () {},
      ),
      body: buildHome3(context),
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Material(
          color: Theme.of(context).primaryColor,
          child: new SafeArea(
              child: Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 90.0, 0.0),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.mood,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.show_chart,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.settings,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

Widget buildHome3(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    child: Column(
      children: <Widget>[
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryLink(
                    text: 'SUITS',
                    image: AssetImage('assets/imgs/landing_bg3.png'),
                    onPressed: () {
                      Navigator.pushNamed(context, "/suits");
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryLink(
                      text: 'WATCHES',
                      image: AssetImage("assets/imgs/watch.png"),
                      onPressed: () {},
                    )),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryLink(
                          text: 'SHOES',
                          image: AssetImage('assets/imgs/shoe.png'),
                          onPressed: () {})),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryLink(
                      text: 'ACCESORIES',
                      image: AssetImage('assets/imgs/bag.png'),
                      onPressed: () {}),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildHome2(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryLink(
              text: 'SUITS',
              image: AssetImage('assets/imgs/landing_bg3.png'),
              onPressed: () {},
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CategoryLink(
                text: 'WATCHES',
                image: AssetImage("assets/imgs/watch.png"),
                onPressed: () {},
              )),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                    text: 'SHOES',
                    image: AssetImage('assets/imgs/shoe.png'),
                    onPressed: () {})),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryLink(
                text: 'ACCESORIES',
                image: AssetImage('assets/imgs/bag.png'),
                onPressed: () {}),
          ),
        ),
      ],
    ),
  );
}

Widget buildHome(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: <Widget>[
        Expanded(
          flex: 2,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CategoryLink(
                            text: 'WATCHES',
                            image: AssetImage("assets/imgs/watch.png"),
                            onPressed: () {},
                          )),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                                text: 'SHOES',
                                image: AssetImage('assets/imgs/shoe.png'),
                                onPressed: () {})),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryLink(
                    text: 'SUITS',
                    image: AssetImage('assets/imgs/landing_bg3.png'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryLink(
                text: 'ACCESORIES',
                image: AssetImage('assets/imgs/bag.png'),
                onPressed: () {}),
          ),
        ),
      ],
    ),
  );
}
