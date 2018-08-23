import 'package:flutter/material.dart';

import '../category/category.dart';
import '../common/screen.dart';
import './category_links.dart';

final Screen homeScreen = Screen(
    title: "HOME",
    contenBuilder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
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
                                  'WATCHES', "assets/imgs/watch.png", () {})),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CategoryLink(
                                    'SHOES', 'assets/imgs/shoe.png', () {})),
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
                            'SUITS', 'assets/imgs/landing_bg3.png', () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Category(
                                'SUITS', 'assets/imgs/landing_bg3.png');
                          }));
                        })),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      CategoryLink('ACCESORIES', 'assets/imgs/bag.png', () {})),
            )
          ],
        ),
      );
    });
