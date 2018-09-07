import 'package:flutter/material.dart';
import 'package:wears/src/data/constants.dart';

class CategoryScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(context));
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      toolbarOpacity: 1.0,
      title: Text('SUITS'),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        padding: const EdgeInsets.only(left: 24.0),
        color: AppColors.primary,
        disabledColor: Colors.grey,
        icon: Image.asset(AppIcons.back),
      ),
      elevation: .0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          color: AppColors.primary,
          disabledColor: Colors.grey,
          icon: ImageIcon(
            AssetImage(AppIcons.cart),
            size: 20.0,
          ),
        ),
        IconButton(
          onPressed: () {},
          color: AppColors.primary,
          disabledColor: Colors.grey,
          icon: ImageIcon(
            AssetImage(AppIcons.search),
            size: 20.0,
          ),
        ),
      ],
    );
  }
}
