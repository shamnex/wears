import 'package:flutter/material.dart';

import '../../../data/constants.dart';

class Category extends StatefulWidget {
  final String _linkImage;
  final String _title;
  Category(
    this._title,
    this._linkImage,
  );
  @override
  CategoryState createState() => new CategoryState();
}

class CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        body: new NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              new SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                leading: new Container(
                  padding: new EdgeInsets.only(top: 0.0),
                  decoration:
                      new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: new MaterialButton(
                    child: new Image.asset(
                      AppIcons.back,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                elevation: 18.0,
                backgroundColor: AppColors.primary.withOpacity(0.98),
                floating: false,
                pinned: true,
                expandedHeight: 250.0,
                flexibleSpace: new FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding: EdgeInsets.all(70.0),
                    child: new Text(
                      widget._title,
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Avenir-Condensed'),
                    ),
                  ),
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
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  indicatorPadding: EdgeInsets.all(0.0),
                  indicatorWeight: 6.0,
                  labelStyle: new TextStyle(fontWeight: FontWeight.w500),
                  tabs: <Widget>[
                    new Tab(text: "REGULAR"),
                    new Tab(text: "CLASSIC")
                  ],
                ),
              ),
            ];
          },
          body: new TabBarView(
            children: <Widget>[
              new Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CategoryGrid().build(context),
              ),
              new Center(
                child: new Center(
                  child: new Text("COMING SOON"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryGrid {
  Widget makeItem(String name, String price, String imgLink, context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 9.0,
        child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imgLink),
            ),
          ),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                      gradient: new LinearGradient(
                    colors: [
                      AppColors.primaryDark2.withOpacity(0.7),
                      AppColors.primaryDark2.withOpacity(0.7),
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
                            fontSize: 15.0),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(3.0),
                      ),
                      new Text(
                        price.toString(),
                        style:
                            new TextStyle(color: Colors.white, fontSize: 12.0),
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

  GridView build(context) {
    return GridView.count(
      childAspectRatio: 1.0,
      crossAxisCount: 2,
      children: <Widget>[
        makeItem(
            'CHECKERED KYUBI', "100,000", "assets/imgs/suit1.png", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit2.png", context),
        makeItem('BLUE DRAGON', "100,000", "assets/imgs/suit3.png", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit4.jpg", context),
        makeItem('GREY BEAST', "100,000", "assets/imgs/suit1.png", context),
      ],
    );
  }
}
