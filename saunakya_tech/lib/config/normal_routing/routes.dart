import 'package:flutter/material.dart';
import 'package:saunakya_tech/app/homepage.dart';
import 'package:saunakya_tech/presentation/reusable_widget/small_text.dart';
import 'package:saunakya_tech/utils/constant/colors.dart';
import 'route_name.dart';

//Default onGenerate route demo
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return _getPageRoute(
        const AppHomePage(),
      );

    default:
      return _getPageRoute(
        Container(
          color: primaryColor,
          child: Center(
            child: SmallText(
              text: "Page Not Found",
              color: blueColor,
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute(
  Widget child,
) {
  return _fadeRoute(
    child: child,
  );
}

// ignore: camel_case_types
class _fadeRoute extends PageRouteBuilder {
  final Widget child;
  _fadeRoute({required this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondani,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondani,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
