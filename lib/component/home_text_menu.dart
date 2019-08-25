import 'package:flutter/material.dart';

class HomeTextMenu extends StatefulWidget {
  @override
  HomeTextMenuState createState() => HomeTextMenuState();
}

class HomeTextMenuState extends State<HomeTextMenu> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.blue,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('本地', style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
          Container(padding: EdgeInsets.only(left: 40), color: Colors.blue,),
          Text('线上', style: TextStyle(color: Colors.white70, fontSize: 25, fontWeight: FontWeight.normal),)
        ],
      ),
    );
  }
}