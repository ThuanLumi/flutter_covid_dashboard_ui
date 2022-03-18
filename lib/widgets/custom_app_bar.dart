import 'package:flutter/material.dart';
import 'package:flutter_template_covid_dashboard_ui/config/palette.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications_none),
          iconSize: 28.0,
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
