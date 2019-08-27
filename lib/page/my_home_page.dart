import 'package:flutter/material.dart';
import 'package:zhu_yin_jing_zhou/component/home_navigation_text_button.dart';

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
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  HomeTitle(),
                  Container(padding: EdgeInsets.only(bottom: 40),),
                  HomeSearch(),
                  Container(padding: EdgeInsets.only(bottom: 20),),
                  HomeNavigationTextButton(),
                  Container(padding: EdgeInsets.only(bottom: 10),),
                  HomeLibrary()
                ],
              ),
            ),
          ),
          Positioned(
              child: AppBar(
                title: Text('APPBAR', style: TextStyle(color: Colors.black),),
                backgroundColor: Color.fromRGBO(255,255,255, 0.8),
                elevation: 0,
              ),
              top: 0,
              left: 0,
              right: 0
          ),
        ],
      ),
    );
  }
}