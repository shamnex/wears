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
    return new Scaffold(
      appBar: AppBar(
        
        flexibleSpace: new FlexibleSpaceBar(
            centerTitle: true,
            background: new Container(
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                image: new AssetImage(widget._linkImage),
                fit: BoxFit.cover,
                repeat: ImageRepeat.repeat,
                colorFilter: new ColorFilter.mode(
                    const Color(0xFF481300).withOpacity(1.0),
                    BlendMode.softLight),
              )),
            )),

        title:new Text(
              widget._title,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Avenir-Condensed'),
                ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: new IconButton(
          color: AppColors.primary,
          onPressed: () {},
          disabledColor: Colors.grey,
          icon: new ImageIcon(
            new AssetImage(AppIcons.back),
            size: 30.0,
            color: AppColors.primary,
          ),
        ),
        actions: <Widget>[
          new IconButton(
            color: AppColors.primary,
            onPressed: () {},
            disabledColor: Colors.grey,
            icon: new ImageIcon(
              new AssetImage(AppIcons.cart),
              size: 25.0,
              color: AppColors.primary,
            ),
          ),
          new IconButton(
            color: AppColors.primary,
            onPressed: () {},
            disabledColor: Colors.grey,
            icon: new ImageIcon(
              new AssetImage(AppIcons.search),
              size: 25.0,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryGrid {
  Widget makeItem(String name, double price, String imgLink) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          image: new DecorationImage(
            image: AssetImage(imgLink),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                decoration: BoxDecoration(
                    gradient: new LinearGradient(
                  colors: [AppColors.primary, Colors.transparent],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
                child: new Text("HELLO WORLD"),
              ),
            ),
          ],
        ),
      ),
    );
  }

  build() {
    return GridView.count(
      padding: EdgeInsets.all(8.0),
      crossAxisCount: 2,

      children: <Widget>[
        makeItem('GREY BEAST', 100.00, "assets/imgs/suit1.png")
      ],
    );
  }
}
