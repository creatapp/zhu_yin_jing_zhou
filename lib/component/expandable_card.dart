import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'dart:ui';

import '../page/reader.dart';

class ExpandableCard extends StatefulWidget {
  @override
  ExpandableCardState createState() => ExpandableCardState();
}

class ExpandableCardState extends State<ExpandableCard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.filled(10, Card1()),
    );
  }
}


const loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {

  List<Object> _bookItemList = [];

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            clipBehavior: Clip.hardEdge,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),),
            child: ScrollOnExpand(
              scrollOnExpand: false,
              scrollOnCollapse: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0),
                child: ScrollOnExpand(
                  scrollOnExpand: true,
                  scrollOnCollapse: false,
                  child: ExpandablePanel(
                    tapHeaderToExpand: true,
                    tapBodyToCollapse: true,
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    header: _getHeader(),
                    collapsed: _getCollapsed(context),
                    expanded: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.filled(5, Padding(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(loremIpsum, softWrap: true, overflow: TextOverflow.fade,)
                        ),)
                    ),
                    builder: (_, collapsed, expanded) {
                      return Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Expandable(
                          collapsed: collapsed,
                          expanded: expanded,
                          crossFadePoint: 0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        )
    );
  }

  Widget _getHeader() {
    return Container(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.add_circle_outline),
              Container(padding: EdgeInsets.only(right: 10),),
              Text('经藏第一', style: TextStyle(fontSize: 20),)
            ],
          ),
          Row(
            children: <Widget>[
              Text('本地10本，在线20本', style: TextStyle(fontSize: 15),)
            ],
          )
        ],
      ),
      padding: EdgeInsets.only(left: 20),
    );
  }

  Widget _getCollapsed (BuildContext context) {
    return Container(
      height: 150,
      child: ListView(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        children: List.filled(10, _getCollapsedCard(context)),
      )
    );
  }

  Widget _getCollapsedCard (BuildContext context) {
    return GestureDetector(
        child: Container(
          width: 105,
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Card(
                    color: Colors.yellow,
                    elevation: 5.0, //设置阴影
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0))), //设置圆角
                    child: Container(
                      height: 100,
                      width: 75,
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    left: 4,
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                            child: Container(
                                width: 75,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(padding: EdgeInsets.only(right: 10),),
                                    SizedBox(
                                      height: 10,
                                      width: 10,
                                      child: CircularProgressIndicator(
                                        value: 0.75,
                                        backgroundColor: Colors.transparent,
                                        valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
                                      ),
                                    ),
                                    Container(padding: EdgeInsets.only(right: 5),),
                                    Text('75%', style: TextStyle(color: Colors.deepOrange),),
                                    Container(padding: EdgeInsets.only(right: 5),),
                                    Text('早', style: TextStyle(color: Colors.deepOrange),)
                                  ],
                                )
                            )
                        )
                    ),
                  ),
                ],
              ),
              Container(
                width: 75,
                child: Center(
                  child: Text(
                    '经文加长加长版名字很长，测试溢出，应该不会溢出',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              )
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
          MaterialPageRoute(builder: (context) => Reader()));
        }
     );
  }
}