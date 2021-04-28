import 'package:flutter/material.dart';
import 'package:flutter_practice/constatns.dart';
import 'package:flutter_practice/page_view/page_view.dart';
import 'package:flutter_practice/sheeps/first_screen.dart';
import 'package:flutter_practice/sheeps/login_screen.dart';
import 'package:flutter_practice/sheeps_profile/detail_screen.dart';
import 'package:flutter_practice/sheeps_profile/sheeps_profile.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Practice',
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => App(),
        '/slidePage': (context) => SlidePage(),
        '/sheepsPage': (context) => FirstScreen(),
        '/loginPage': (context) => LoginScreen(),
        '/profile': (context) => SheepsProfile(),
        DetailScreen.routeName: (context) => DetailScreen(),
      },
    );
  }
}


