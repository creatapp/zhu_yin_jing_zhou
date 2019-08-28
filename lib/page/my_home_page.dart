import 'dart:ui';

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
        fit: StackFit.expand,
        children: <Widget>[
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 80),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: <Widget>[
                  Container(padding: EdgeInsets.only(bottom: 30),),
                  HomeTitle(),
                  Container(padding: EdgeInsets.only(bottom: 40),),
                  HomeNavigationTextButton(),
                  Container(padding: EdgeInsets.only(bottom: 20),),
                  HomeLibrary()
                ],
              ),
            ),
          ),
          Positioned(
              child: AppBar(
                title: HomeSearch(),
                backgroundColor: Color.fromRGBO(255,255,255, 0.9),
                elevation: 0,
              ),
              top: 0,
              left: 0,
              right: 0
          ),
          Positioned(
            bottom: 10,
            left: 30,
            right: 30,
            child: IgnorePointer(
              ignoring: true,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    color: Colors.white.withOpacity(0.1),
                    height: 50,
                    width: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text('本地', style: TextStyle(fontSize: 20, backgroundColor: Colors.yellow.withOpacity(0.5)),),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                              width: 2,
                              color: Colors.black26,
                            ),
                            Text('线上', style: TextStyle(fontSize: 20, color: Colors.black26),)
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.sort),
                          color: Colors.yellow,
                          onPressed: (){},
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          color: Colors.yellow,
                          onPressed: (){},
                          iconSize: 30,
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_upward),
                          color: Colors.yellow,
                          onPressed: (){},
                          iconSize: 30,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ),
          )
        ],
      ),
      );
  }
}