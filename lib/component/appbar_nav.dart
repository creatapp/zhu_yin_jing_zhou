import 'package:flutter/material.dart';

class AppbarNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.search, color: Colors.black45,),
        Container(padding: EdgeInsets.only(left: 20),),
        Icon(Icons.feedback, color: Colors.black45,),
        Container(padding: EdgeInsets.only(left: 20),),
        Icon(Icons.remove_red_eye, color: Colors.black45,),
      ],
    );
  }
}