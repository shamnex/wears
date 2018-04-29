import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

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
    return new CustomScrollView(
      slivers: <Widget>[
        new SliverAppBar(
          leading: new Container(
            padding: new EdgeInsets.only(top:5.0),
            decoration:new BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    child: new MaterialButton(
          child: new Image.asset(AppIcons.back, color: Colors.white,),
          onPressed:(){},
                    
                    ),
        ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
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
                    const Color(0xFF481300).withOpacity(1.0),
                    BlendMode.softLight),
              )),
            ),
            title:
             new Text(
              widget._title,
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 26.0,
                  fontWeight: FontWeight.w900,
                  fontFamily: 'Avenir-Condensed'),
                ),
          ),
        ),

        new GridView.count(
          children: <Widget>[
            new Card(
              
            )
            
          ],
  crossAxisCount: 2,
        ),

      ],
    );
  }
}
