import 'package:flutter/material.dart';

import '../../../data/constants.dart';

class Category extends StatefulWidget {
  final String _linkImage;
  final String _title;
  Category(this._linkImage, this._title);
  @override
  CategoryState createState() => new CategoryState();
}

class CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.background,
          child: new CustomScrollView(
          slivers: <Widget>[
      new SliverAppBar(
        leading: new Container(
          padding: new EdgeInsets.only(top: 0.0),
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: new MaterialButton(
            child: new Image.asset(
              AppIcons.back,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
        elevation: 0.0,
        backgroundColor: AppColors.primary,
        pinned: true,
        expandedHeight: MediaQuery.of(context).size.height / 2.5,
        flexibleSpace: new FlexibleSpaceBar(
          centerTitle: true,
          background: new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
              image: new AssetImage(widget._linkImage),
              fit: BoxFit.cover,
              repeat: ImageRepeat.repeat,
              colorFilter: new ColorFilter.mode(
                  const Color(0xFF481300).withOpacity(0.7),
                  BlendMode.softLight),
            )),
          ),
          title: new Text(
            widget._title,
            style: new TextStyle(
                color: Colors.white,
                fontSize: 26.0,
                fontWeight: FontWeight.w900,
                fontFamily: 'Avenir-Condensed'),
          ),
        ),
        actions: <Widget>[
          new IconButton(
            onPressed: () {},
            disabledColor: Colors.grey,
            icon: new ImageIcon(
              new AssetImage(AppIcons.cart),
              size: 20.0,
              color: Colors.white,
            ),
          ),
          new IconButton(
            onPressed: () {},
            disabledColor: Colors.grey,
            icon: new ImageIcon(
              new AssetImage(AppIcons.search),
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      CategoryGrid().build(context)
          ],
        ),
    );
  }
}

class CategoryGrid {
  Widget makeItem(String name, String price, String imgLink, context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
          elevation: 10.0,
          child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgLink),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width/2,
                  padding: EdgeInsets.symmetric(vertical:20.0, horizontal:10.0 ),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                    colors: [
                      const Color(0xFF160800),
                      const Color(0xFF160800).withOpacity(0.7),
                      // AppColors.primary.withOpacity(0.7),
                      Colors.transparent
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        name,
                        style: new TextStyle(   
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 15.0

                        ),
                      ),
                      new Padding(padding: EdgeInsets.all(3.0),),
                      new Text(
                        price.toString(),
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 12.0

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SliverGrid build(context) {
    return SliverGrid.count(
      childAspectRatio: 1.0,
      crossAxisCount: 2,
      children: <Widget>[
        makeItem('CHECKERED KYUBI', "100,000", "assets/imgs/suit1.png", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit2.png", context),
        makeItem('BLUE DRAGON', "100,000", "assets/imgs/suit3.png", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit4.jpg", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit1.png", context),
      ],
    );
  }
}
