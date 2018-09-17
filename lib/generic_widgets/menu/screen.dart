import 'package:flutter/material.dart';

import 'blured_menu_controller.dart';
import '../../data/constants.dart';

class BluredMenuScreen extends StatelessWidget {
  @required
  final String title;
  @required
  final Widget body;

  BluredMenuScreen({this.title, this.body});

  Widget build(BuildContext context) {
    return Material(
      child: body,
      
    );
    // return Scaffold(
    //   backgroundColor: AppColors.background,
    //   appBar: buildAppBar(context),
    //   body: body,
      
    // );
  }

//   Widget buildAppBar(BuildContext context) {
//     return AppBar(
//       toolbarOpacity: 1.0,
//       elevation: .0,
//       backgroundColor: Colors.transparent,
//       title: Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.only(right: 55.0),
//         child: Text(
//           title,
//           style: TextStyle(
//               fontFamily: 'Antonio',
//               fontWeight: FontWeight.w900,
//               fontSize: 22.0,
//               color: AppColors.primary),
//         ),
//       ),
//     );
//   }
// }
}