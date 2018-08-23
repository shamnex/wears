import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../widgets/category_links.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildHome3(context),
    );
  }
}

Widget buildAppBar(BuildContext context) {
  return AppBar(
      toolbarOpacity: 1.0,
      leading: IconButton(
        padding: const EdgeInsets.fromLTRB(24.0, 0.0, 0.0, 0.0),
        color: AppColors.primary,
        onPressed: () {},
        disabledColor: Colors.grey,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 2.0,
              width: 35.0,
              color: Theme.of(context).primaryColor,
              margin: EdgeInsets.only(bottom: 5.0),
            ),
            Container(
              height: 2.0,
              width: 25.5,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      elevation: .0,
      backgroundColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 55.0),
        child: Text(
          "HOME",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 20.0,
              color: AppColors.primary),
        ),
      ));
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
