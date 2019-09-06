import 'package:flutter/material.dart';
import 'dart:ui';

class BottomFloatingNavigation extends StatefulWidget {
  @override
  BottomFloatingNavigationState createState() => BottomFloatingNavigationState(_scrollController);

  final ScrollController _scrollController;

  BottomFloatingNavigation(this._scrollController);
}

class BottomFloatingNavigationState extends State<BottomFloatingNavigation> {

  final ScrollController _scrollController;

  BottomFloatingNavigationState(this._scrollController);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Container(
            color: Colors.white.withOpacity(0.1),
            height: 50,
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.sort),
                  color: Colors.deepOrangeAccent,
                  onPressed: (){},
                  iconSize: 30,
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.deepOrangeAccent,
                  onPressed: (){},
                  iconSize: 30,
                ),
                IconButton(
                  icon: Icon(Icons.arrow_upward),
                  color: Colors.deepOrangeAccent,
                  onPressed: (){
                    _scrollController.animateTo(.0, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                  },
                  iconSize: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}