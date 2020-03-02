import 'package:flutter/material.dart';
import 'package:flutterprovider/pages/home_page.dart';
import 'package:flutterprovider/pages/splash.dart';
import 'package:provider/provider.dart';
import 'package:flutterprovider/api/post_api.dart';

void main (){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: new Splash(),
        routes: <String, WidgetBuilder>{
          '/HomeScreen': (BuildContext context) => new HomePage()
        },

    );
  }
}
