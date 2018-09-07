import 'package:flutter/material.dart';

import 'menu_controller.dart';
import '../../data/constants.dart';

class Screen extends StatelessWidget {
   @required final String title;
   @required final Widget body;

  Screen({this.title, this.body});

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: buildAppBar(context, menuController),
      body: body,
    );
  }

  Widget buildAppBar(BuildContext context, MenuController bloc) {
    return AppBar(
      toolbarOpacity: 1.0,
      leading: IconButton(
        onPressed: () => bloc.openMenu$,
        padding: const EdgeInsets.only(left: 24.0),
        color: AppColors.primary,
        disabledColor: Colors.grey,
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 2.0,
              width: 35.0,
              color: Theme.of(context).primaryColor,
              margin: EdgeInsets.only(bottom: 5.0),
            ),
            Container(
              height: 2.0,
              width: 25.5,
              color: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
      elevation: .0,
      backgroundColor: Colors.transparent,
      title: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(right: 55.0),
        child: Text(
          title,
          style: TextStyle(
            fontFamily: 'Antonio',
              fontWeight: FontWeight.w900,
              fontSize: 22.0,
              color: AppColors.primary),
        ),
      ),
    );
  }
}
