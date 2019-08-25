import 'package:flutter/material.dart';

class HomeTitle extends StatefulWidget {
  @override
  HomeTitleState createState() => HomeTitleState();
}

class HomeTitleState extends State<HomeTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.only(bottom: 20),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('八月二十五日', style: TextStyle(fontSize: 25),),
              Text('巴拉巴拉日')
            ],
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Row(
            children: <Widget>[
              Text('佛法僧心等，诸佛无心', style: TextStyle(color: Colors.black87, fontSize: 15),)
            ],
          )
        ],
      ),
    );
  }
}