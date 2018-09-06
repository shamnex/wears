import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return buildCart();
  }

  Widget buildCart() {
      return ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
            return Container(

              height: 30.0,
              child: Text("item $index")

            );
        },
      );
  }
}