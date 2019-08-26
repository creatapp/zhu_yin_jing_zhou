import 'package:flutter/material.dart';

class HomeLibrary extends StatefulWidget {
  @override
  HomeLibraryState createState() => HomeLibraryState();
}

class HomeLibraryState extends State<HomeLibrary> {

  List<int> items = List.generate(10, (i) => i);
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.purple,
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  child: Center(
                    child: Text('巴拉巴历经', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 30),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('title'),
                      Row(
                        children: <Widget>[
                          Text('这里是介绍性文字', overflow: TextOverflow.ellipsis,),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('大小：2.3M'),
                      RaisedButton.icon(
                        icon: Icon(Icons.arrow_downward),
                        label: Text('下载'),
                        color: Colors.purple,
                        textColor: Colors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        onPressed: null,
                      ),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}