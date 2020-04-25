import 'package:flutter/material.dart';
import 'ui/login_ui.dart';
import 'ui/home_ui.dart';
import 'ui/maps_ui.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BPS Tracking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => LoginPage(),
        '/home': (BuildContext context) => HomePage(),
        '/location': (BuildContext context) => GoogleMapsPage(),
        // '/location': (BuildContext context) => HomePage(),
      },
    );
  }
}

