import 'package:flutter/material.dart';
import 'dart:ui';

class BottomFloatingNavigation extends StatefulWidget {
  @override
  BottomFloatingNavigationState createState() => BottomFloatingNavigationState();
}

class BottomFloatingNavigationState extends State<BottomFloatingNavigation> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 30,
      right: 30,
      child: IgnorePointer(
          ignoring: true,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
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
                      onPressed: (){},
                      iconSize: 30,
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}