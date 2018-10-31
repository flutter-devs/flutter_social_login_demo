import 'dart:async';

import 'package:flutter_social_login/Constant/Constant.dart';
import 'package:flutter_social_login/Screens/SplashScreen.dart';
import 'package:flutter_social_login/Screens/LogInScreen.dart';
// import 'package:flutter_social_login/Screens/FacebookScreen.dart';
// import 'package:flutter_social_login/Screens/GoogleScreen.dart';
// import 'package:flutter_social_login/Screens/TwitterScreen.dart';

import 'package:flutter/material.dart';


main() {

  runApp(new MaterialApp(
    title: 'FluterLogindemo',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
      accentColor: Colors.black,
      primaryColor: Colors.black,
      primaryColorDark: Colors.black

    ),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),
      LOGIN_SCREEN: (BuildContext context) => new LogInScreen(),
//       FACEBOOK_SCREEN: (BuildContext context) => new FacebookScreen(),
//       TWITTER_SCREEN: (BuildContext context) => new TwitterScreen(),
      // GOOGLE_SCREEN: (BuildContext context) => new GoogleScreen()
    },
  ));
}


