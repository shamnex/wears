import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return buildCart();
  }

  Widget buildCart() {
      return ListView.builder(
        itemCount:49,
        itemBuilder: (BuildContext context, int index) {
            return Container(

              height: 30.0,
              child: Text("Favorite item ${index + 1}")

            );
        },
      );
  }
}