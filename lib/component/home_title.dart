import 'package:flutter/material.dart';

class HomeTitle extends StatefulWidget {
  @override
  HomeTitleState createState() => HomeTitleState();
}

class HomeTitleState extends State<HomeTitle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
              Text('若见诸相非相，即见如来。   --《金刚经》', style: TextStyle(color: Colors.black87, fontSize: 15),)
            ],
          )
        ],
      ),
    );
  }
}