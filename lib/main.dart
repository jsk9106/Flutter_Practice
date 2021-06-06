import 'package:flutter/material.dart';
import 'package:flutter_practice/blur/blur_screen.dart';
import 'package:flutter_practice/constatns.dart';
import 'package:flutter_practice/drop_down/drop_down.dart';
import 'package:flutter_practice/getx_test/getx_text_screen.dart';
import 'package:flutter_practice/inner_shadow/inner_shadow_screen.dart';
import 'package:flutter_practice/page_view/page_view.dart';
import 'package:flutter_practice/provider_test/Provider_test.dart';
import 'package:flutter_practice/provider_test/provider/count_provider.dart';
import 'package:flutter_practice/sheeps/first_screen.dart';
import 'package:flutter_practice/sheeps/login_screen.dart';
import 'package:flutter_practice/sheeps_community/provider/community_provider.dart';
import 'package:flutter_practice/sheeps_community/sheeps_community_Screen.dart';
import 'package:flutter_practice/sheeps_profile/detail_screen.dart';
import 'package:flutter_practice/sheeps_profile/sheeps_profile.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountProvider()),
        ChangeNotifierProvider(create: (context) => CommunityProvider()),
      ],
      child: GetMaterialApp(
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
          DropDown.routeName: (context) => DropDown(),
          '/provider': (context) => ProviderTest(),
          '/SheepsCommunity': (context) => SheepsCommunityScreen(),
          '/InnerShadow': (context) => InnerShadowScreen(),
          '/Blur': (context) => BlurScreen(),
          '/GetXTest': (context) => GetXTestScreen(),
        },
      ),
    );
  }
}
