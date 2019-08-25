import 'package:flutter/material.dart';

import '../component/home_title.dart';
import '../component/home_text_menu.dart';
import '../component/home_library.dart';
import '../constant/theme.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MyTheme myTheme = MyTheme.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          HomeTitle(),
          Container(padding: EdgeInsets.only(left: 20, bottom: 20), color: Colors.blue,),
          HomeTextMenu(),
          Container(padding: EdgeInsets.only(bottom: 20),),
          HomeLibrary()
        ],
      ),
    );
  }
}