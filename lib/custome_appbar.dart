import 'package:flutter/material.dart';

import 'appbar_style.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({super.key, required this.title});

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
  
  @override
  Size get preferredSize =>const Size.fromHeight(kToolbarHeight);
}

class _CustomAppbarState extends State<CustomAppbar> {
  final AppBarStyleClass appBarStyleClass = AppBarStyleClass();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appBarStyleClass.appbarStyle.color,
      title: Text(widget.title),
      actions: [
        IconButton(
            onPressed: () async {
              await appBarStyleClass.toggleWithDelay().then((value) {
                setState(() {
                  
                });
              });
            },
            icon: Icon(appBarStyleClass.appbarStyle.icon))
      ],
    );
  }

  
}
