import 'package:bttvstickers/constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final bool small;
  final bool centerTitle;
  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;

  const NavBar({
    Key? key,
    this.small = false,
    this.centerTitle = false,
    this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Size get preferredSize =>
      Size.fromHeight(!small ? kNavBarHeight : kSmallNavBarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          !small ? Theme.of(context).secondaryHeaderColor : Colors.transparent,
      elevation: !small ? kNavBarElevation : 0.0,
      // ignore: deprecated_member_use
      brightness: Theme.of(context).brightness,
      centerTitle: centerTitle,
      title: title,
      leading: leading,
      actions: actions,
    );
  }
}
