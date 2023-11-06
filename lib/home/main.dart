import 'package:flutter/material.dart';

import '../category/category.dart';
import 'homescreen.dart';
import 'my_themes.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        Category.routeName: (context) => Category(),

      },
      initialRoute: Category.routeName,
      theme: MyTheme.lightTheme,
    );
  }}