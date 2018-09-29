import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/screens/main/tabs/category/category_link.dart';

class CategoryHomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
      child: Column(children: <Widget>[
        SizedBox(height: 80.0),
        buildHome(context),
      ]),
    );
  }

  Widget buildHome3(BuildContext context) {
    return Expanded(
      child: Padding(
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
                      child: Hero(
                        tag: "categeory/suits",
                        child: CategoryLink(
                          rotateTitle: true,
                          text: 'SUITS',
                          image: AssetImage('assets/imgs/suits_bg.jpg'),
                          onPressed: () {
                            Navigator.pushNamed(context, "/suits");
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CategoryLink(
                          rotateTitle: true,
                          text: 'WATCHES',
                          image: AssetImage("assets/imgs/watch.jpg"),
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
                              rotateTitle: true,
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
                          rotateTitle: true,
                          text: 'ACCESORIES',
                          image: AssetImage('assets/imgs/tie.jpg'),
                          onPressed: () {}),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome2(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                  rotateTitle: false,
                  text: 'SUITS',
                  image: AssetImage('assets/imgs/suits_bg.jpg'),
                  onPressed: () {},
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryLink(
                    rotateTitle: false,
                    text: 'WATCHES',
                    image: AssetImage("assets/imgs/watch.jpg"),
                    onPressed: () {},
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CategoryLink(
                        rotateTitle: false,
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
                    rotateTitle: false,
                    text: 'ACCESORIES',
                    image: AssetImage('assets/imgs/tie.jpg'),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome4(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryLink(
                        rotateTitle: false,
                        text: 'SUITS',
                        image: AssetImage('assets/imgs/suits_bg.jpg'),
                        onPressed: () {},
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                              rotateTitle: false,
                              text: 'WATCHES',
                              image: AssetImage("assets/imgs/watch.jpg"),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryLink(
                                    rotateTitle: false,
                                    text: 'SHOES',
                                    image: AssetImage('assets/imgs/shoe.png'),
                                    onPressed: () {})),
                          ),
                        ),
                      ],
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
                    rotateTitle: false,
                    text: 'ACCESORIES',
                    image: AssetImage('assets/imgs/tie.jpg'),
                    onPressed: () {}),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHome(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Hero(
                        tag: "category/suits",
                        child: CategoryLink(
                          rotateTitle: false,
                          text: 'SUITS',
                          image: AssetImage('assets/imgs/suits_bg.jpg'),
                          onPressed: () {
                            Navigator.pushNamed(context, "category/suits");
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                              rotateTitle: false,
                              text: 'WATCHES',
                              image: AssetImage("assets/imgs/watch.jpg"),
                              onPressed: () {},
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryLink(
                                    rotateTitle: false,
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
                                rotateTitle: false,
                                text: 'ACCESORIES',
                                image: AssetImage('assets/imgs/tie.jpg'),
                                onPressed: () {}),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
