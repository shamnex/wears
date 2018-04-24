import 'package:flutter/material.dart';
import '../../blur_scaffold.dart';
import '../../constants.dart';
import '../app/screens/account_screen.dart';
import '../menu.dart';

class AppPage extends StatefulWidget {
  @override
  AppPageState createState() => new AppPageState();
}

class AppPageState extends State<AppPage> {

  var activeScreen = otherScreen;
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Stack(
        children: <Widget>[
           createScreen(activeScreen, context ), 
          //  showBluredMenu(buildMenu())
           ],
      ),
    );
  }
}

createScreen(Screen activeScreen, BuildContext context) {
  return new Scaffold(
    backgroundColor: AppColors.background,
    appBar: new AppBar(
      leading: new IconButton(
        onPressed: () {},
        icon: new ImageIcon(
          new AssetImage("assets/icons/menu.png"),
          size: 30.0,
          color: AppColors.primary,
        ),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      title: new Center(
        child: new Padding(
          padding: const EdgeInsets.only(right: 55.0),
          child: new Text(
           activeScreen.title,
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: AppColors.primary),
          ),
        ),
      ),
    ),
    body: activeScreen.contenBuilder(context),
  );
}

