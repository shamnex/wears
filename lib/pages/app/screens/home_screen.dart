
import 'package:flutter/material.dart' show BuildContext, Column, Container, EdgeInsets, Expanded, Padding, Row, Widget;
import '../../../blur_scaffold.dart';
import '../ui/home_links.dart';


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
                            child: new HomeLinkStyle(
                                'WATCHES', "assets/imgs/watch.png")),
                      ),
                      new Expanded(
                        flex: 1,
                        child: new Container(
                          child: new Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: new HomeLinkStyle(
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
                      child: new HomeLinkStyle(
                          'SUITS', 'assets/imgs/landing_bg3.png')),
                )

              ],
            ),
          ),
          
          new Expanded(
            flex: 2,
            child: new Padding(
                padding: const EdgeInsets.all(2.0),
                child: new HomeLinkStyle('ACCESORIES', 'assets/imgs/bag.png')),
          )

        ],
      ),
    );
  }
  
);



