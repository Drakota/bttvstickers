import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool small;
  final Widget title;
  final Widget leading;
  final bool centerTitle;
  final List<Widget> actions;

  NavBar({
    this.small = false,
    this.centerTitle = false,
    this.title,
    this.leading,
    this.actions,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(!small ? kNavBarHeight : kSmallNavBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          !small ? Theme.of(context).secondaryHeaderColor : Colors.transparent,
      elevation: !small ? kNavBarElevation : 0.0,
      brightness: Theme.of(context).brightness,
      centerTitle: this.centerTitle,
      title: this.title,
      leading: this.leading,
      actions: this.actions,
    );
  }
}
