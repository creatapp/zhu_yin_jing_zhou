import 'package:flutter/material.dart';

class AppbarNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Icon(Icons.more_vert, color: Colors.black45,),
      ],
    );
  }
}