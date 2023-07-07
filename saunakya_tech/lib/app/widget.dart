import 'package:flutter/material.dart';
import '../presentation/pages/profile_page/user_list.dart';
import '../presentation/pages/timer_count/timer_page.dart';

Widget buildPage(int index) {
  List<Widget> widgetPages = [
   CountdownScreen(),
   const UserListScreen(),
  ];
  return widgetPages[index];
}

var bottomTab = const [
  BottomNavigationBarItem(
    label: "home",
    icon: Icon(Icons.home),
  ),
  BottomNavigationBarItem(
    label: "List",
    icon: Icon(Icons.people),
  ),
  
];
