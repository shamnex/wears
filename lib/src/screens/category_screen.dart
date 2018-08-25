import 'package:flutter/material.dart';

import '../data/constants.dart';

class CategoryScreen extends StatefulWidget {
  final String linkImage;
  final String title;
  CategoryScreen({
    this.title,
    this.linkImage,
  });
  @override
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                forceElevated: innerBoxIsScrolled,
                leading: Container(
                  padding: EdgeInsets.only(top: 0.0),
                  decoration:
                      BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  child: MaterialButton(
                    child: Image.asset(
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
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Container(
                    padding: EdgeInsets.all(70.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Avenir-Condensed'),
                    ),
                  ),
                  background: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage(widget.linkImage),
                      fit: BoxFit.cover,
                      repeat: ImageRepeat.repeat,
                      colorFilter: ColorFilter.mode(
                          const Color(0xFF481300).withOpacity(0.7),
                          BlendMode.softLight),
                    )),
                  ),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {},
                    disabledColor: Colors.grey,
                    icon: ImageIcon(
                      AssetImage(AppIcons.cart),
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    disabledColor: Colors.grey,
                    icon: ImageIcon(
                      AssetImage(AppIcons.search),
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  indicatorPadding: EdgeInsets.all(0.0),
                  indicatorWeight: 6.0,
                  labelStyle: TextStyle(fontWeight: FontWeight.w500),
                  tabs: <Widget>[
                    Tab(text: "REGULAR"),
                    Tab(text: "CLASSIC"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CategoryGrid().buildGrid(context),
              ),
              Center(
                child: Center(
                  child: Text("COMING SOON"),
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
            image: DecorationImage(
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
                      gradient: LinearGradient(
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
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 15.0),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                      ),
                      Text(
                        price.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 12.0),
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

  GridView buildGrid(context) {
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
