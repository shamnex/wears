import 'package:flutter/material.dart';

import '../common/screen.dart';
import './category_links.dart';



final Screen homeScreen = new Screen(
  title: "Home",
  contenBuilder: ( BuildContext context) {
    return  new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 5,

            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: new Column(
                    children: <Widget>[
                      new Expanded(
                        flex: 1,
                        child: new Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new HomeLink(
                                'WATCHES', "assets/imgs/watch.png")),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new HomeLink(
                                  'SHOES', 'assets/imgs/shoe.png')),
                        ),
                      ),
                    ],
                  ),
                ),

                new Expanded(
                  flex: 1,
                  child: new Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new HomeLink(
                            'SUITS', 'assets/imgs/landing_bg3.png')),
                )
              ],
            ),
          ),
          
          new Expanded(
            flex: 2,
            child: new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new HomeLink('ACCESORIES', 'assets/imgs/bag.png')),
          )
        ],
      ),
    );
  }
  
);

class HomeLinkStyle {
}



