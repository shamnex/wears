import 'package:flutter/material.dart';

import '../ui_styles/home_styles.dart';

class HomePage extends StatefulWidget {
  final Color _primaryColor = const Color(0xFF481300);
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: const Color(0xFFE8E8E8),
      appBar: new AppBar(
        leading: new IconButton(
          onPressed: () {},
          icon: new Icon(Icons.menu, color: widget._primaryColor),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: new Center(
          child: new Padding(
            padding: const EdgeInsets.only(right: 55.0),
            child: new Text(
              "HOME",
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: widget._primaryColor),
            ),
          ),
        ),
      ),
      body: new Padding(
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
                            child: new HomeLinkStyle('WATCHES',"assets/imgs/watch.png" )
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child: new Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: new HomeLinkStyle('SHOES', 'assets/imgs/shoe.png')

                          ),
                        ),
                      ],
                    ),
                  ),

                  new Expanded(
                    flex: 1,
                    child: new Padding(
                      padding: const EdgeInsets.all(8.0),
                       child: new HomeLinkStyle('SUITS','assets/imgs/landing_bg3.png')
                    ),
                  )

                ],
              ),
            ),
            new Expanded(
              flex: 2,
              child: new Padding(
                padding: const EdgeInsets.all(8.0),
                 child: new HomeLinkStyle('ACCESORIES', 'assets/imgs/bag.png' )
              ),
            )
          ],
        ),
      ),
    );
  }
}
