import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'dart:ui';

import '../page/reader.dart';

class ExpandableCard extends StatefulWidget {
  @override
  ExpandableCardState createState() => ExpandableCardState();
}

class ExpandableCardState extends State<ExpandableCard> {

  ExpandableController _expandableController = ExpandableController();
  bool _expand = false;

  @override
  void initState() {
    super.initState();
    _expandableController.addListener((){
        if (_expand != _expandableController.expanded) {
          setState(() {
            _expand = _expandableController.expanded;
          });
        }
    });
  }

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
            scrollOnExpand: true,
            scrollOnCollapse: true,
            child: ExpandablePanel(
              tapHeaderToExpand: true,
              tapBodyToCollapse: false,
              iconPlacement: ExpandablePanelIconPlacement.right,
              hasIcon: false,
              controller: _expandableController,
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              header: _getHeader(),
              collapsed: _getCollapsed(context),
              expanded: _getExpanded(context),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    crossFadePoint: 10,
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return Container(
      child: Row (
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(_expand ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
              Container(padding: EdgeInsets.only(right: 10),),
              Text('经藏第一', style: TextStyle(fontSize: 20),)
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Text(_expand ? '在线20本' : '本地10本', style: TextStyle(fontSize: 15),),
              )
            ],
          )
        ],
      ),
      padding: EdgeInsets.only(left: 20),
    );
  }
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

Widget _getExpanded(BuildContext context) {

  var verCard =  Column(
    children: <Widget>[
      Container(padding: EdgeInsets.only(top: 15),),
      Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Card(
                  color: Colors.yellow,
                  elevation: 15.0, //设置阴影
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))), //设置圆角
                  child: Container(
                    height: 120,
                    width: 90,
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
                              width: 90,
                              height: 30,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    child: Text('查看详情', style: TextStyle(color: Colors.deepOrange),),
                                    onTap: (){debugPrint('download');},
                                  )
                                ],
                              )
                          )
                      )
                  ),
                ),
              ],
            ),
            Container(padding: EdgeInsets.only(left: 30),),
            Container(
              height: 120,
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 178,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('书籍的名字很长长测试溢出', style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('译者  ', style: TextStyle(color: Colors.black38),),
                          Text('一位名字很长很长的译者',
                            style: TextStyle(color: Colors.black38),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,),
                        ],
                      )
                    ],
                  ),
                  Text('介绍 ' * 30,
                    style: TextStyle(color: Colors.black45),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(padding: EdgeInsets.only(top: 15),),
    ],
  );
  return Column(
    children: List.filled(20, verCard),
  );
}