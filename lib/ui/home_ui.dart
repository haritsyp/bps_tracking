import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences preferences;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  var _current = 0;
  String nama;
  //ApiService apiService;
  
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    TextStyle fontJudul = TextStyle(
      // fontFamily: 'Lato',
      fontSize: mediaQuery.size.width > 360 ? 20.0 : 14.0,
      fontWeight: FontWeight.bold
    );
    TextStyle fontIsi = TextStyle(
      // fontFamily: 'Lato',
      fontSize: mediaQuery.size.width > 360 ? 16.0 : 12.0,
    );
    
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: SafeArea(
          child: ListView(
            padding: EdgeInsets.only(bottom: 16.0),
            children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Center(child: Text('Hello'),),
              )
              ,)
          ]
        )
        )
    );
  }

}

