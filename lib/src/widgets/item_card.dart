import 'package:flutter/material.dart';
import 'package:wears/data/constants.dart';

class ItemCard extends StatelessWidget {
  final double width;
  const ItemCard({
    Key key,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(right: 15.0),
      width: width ?? 160.0,
      child: Column(children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            minWidth: 140.0,
            minHeight: 180.0,
            maxHeight: 180.0,
            
          ),
          child: Container(
            height: 180.0,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      WearsImages.suit8,
                    ))),
          ),
        ),
        Container(
          height: 60.0,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  text: "Gray Beast\n",
                  style: TextStyle(
                    fontFamily: "Antonio",
                    fontSize: 16.0,
                    color: WearsColors.text,
                  ),
                  children: [
                    TextSpan(
                      text: "N 1000",
                      style: TextStyle(fontFamily: "Raleway", fontSize: 12.0),
                    ),
                  ],
                ),
              ),
              Icon(Icons.favorite_border)
            ],
          ),
        ),
      ]),
    );
  }
}
