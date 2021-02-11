import 'package:bttvstickers/routes.dart' as routes;
import 'package:flutter/material.dart';

Route createRoute(routes.Route route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        route.builder(context),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = route?.transitionSettings?.startPosition ?? Offset.zero;
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
