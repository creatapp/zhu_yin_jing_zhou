import 'package:flutter/material.dart';

import '../component/home_title.dart';
import '../component/home_search.dart';
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: <Widget>[
            HomeTitle(),
            Container(padding: EdgeInsets.only(bottom: 40),),
            HomeSearch(),
            Container(padding: EdgeInsets.only(bottom: 40),),
            HomeLibrary()
          ],
        ),
      )
    );
  }
}