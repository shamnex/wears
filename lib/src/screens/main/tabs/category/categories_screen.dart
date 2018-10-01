import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';
import 'package:wears/src/screens/main/tabs/category/category_link.dart';
import 'package:wears/src/widgets/main_title.dart';

class CategoriesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Material(
      color: WearsColors.background,
      child: Column(children: <Widget>[
        SafeArea(
          child: Container(
            height: 50.0,
            padding: EdgeInsets.only(
              right: 20.0,
            ),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {},
              child: Hero(
                tag: "searchButton",
                child: Icon(
                  Icons.search,
                  size: 25.0,
                  color: WearsColors.primary,
                ),
              ),
            ),
          ),
        ),
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
                          title: WearsTitle(
                            text: 'SUITS',
                            rotate: true,
                          ),
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
                          title: WearsTitle(
                            text: 'WATCHES',
                            rotate: true,
                          ),
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
                              title: WearsTitle(
                                text: 'SHOES',
                                rotate: true,
                              ),
                              image: AssetImage('assets/imgs/shoe.png'),
                              onPressed: () {})),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CategoryLink(
                          title: WearsTitle(
                            text: 'ACCESORIES',
                            rotate: true,
                          ),
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
                  title: WearsTitle(text: 'SUITS'),
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
                    title: WearsTitle(text: 'WATCHES'),
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
                        title: WearsTitle(text: "SHOES"),
                        image: AssetImage('assets/imgs/shoe.png'),
                        onPressed: () {})),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CategoryLink(
                    title: WearsTitle(
                      text: "ACCESORIES",
                    ),
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
                        title: WearsTitle(text: 'Suits'),
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
                              title: WearsTitle(text: 'WATCHES'),
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
                                    title: WearsTitle(text: 'SHOES'),
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
                    title: WearsTitle(text: 'ACCESORIES'),
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
                        child: Material(
                          child: CategoryLink(
                            textAlignment: Alignment.bottomLeft,
                            title: WearsTitle(text: 'SUITS'),
                            image: AssetImage('assets/imgs/suits_bg.jpg'),
                            onPressed: () {
                              Navigator.pushNamed(context, "category/suits");
                            },
                          ),
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
                              textAlignment: Alignment.bottomLeft,
                              title: WearsTitle(text: 'SUITS'),
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
                                    textAlignment: Alignment.bottomLeft,
                                    title: WearsTitle(text: 'SHOES'),
                                    image: AssetImage('assets/imgs/shoe.png'),
                                    onPressed: () {})),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CategoryLink(
                                textAlignment: Alignment.bottomLeft,
                                title: WearsTitle(text: 'ACCESORIES'),
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
