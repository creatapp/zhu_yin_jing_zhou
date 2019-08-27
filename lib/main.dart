import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'constant/theme.dart';
import 'page/my_home_page.dart';

void main() {
//  debugPaintLayerBordersEnabled = true;
//  debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MyTheme theme = MyTheme.getInstance();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: ThemeData(
        backgroundColor: Colors.white
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}