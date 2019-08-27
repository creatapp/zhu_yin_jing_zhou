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
                color: Colors.pink,
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  child: Center(
                    child: Text('巴拉巴历经', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 20),),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 198,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('巴拉巴历经加长看溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Container(padding: EdgeInsets.only(bottom: 4),),
                        Text('这里是介绍性文字，巴拉巴历经是一个溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(color: Colors.black38),overflow: TextOverflow.ellipsis, maxLines: 2,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('查看详情', style: TextStyle(color: Colors.blue),),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: RaisedButton.icon(
                            icon: Icon(Icons.arrow_downward),
                            label: Text('下载', style: TextStyle(fontSize: 15),),
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            onPressed: (){debugPrint('here');},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Divider(color: Colors.black26,),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.deepPurple,
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  child: Center(
                    child: Text('巴拉巴历经', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 20),),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 198,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('巴拉巴历经加长看溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Container(padding: EdgeInsets.only(bottom: 4),),
                        Text('这里是介绍性文字，巴拉巴历经是一个溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(color: Colors.black38),overflow: TextOverflow.ellipsis, maxLines: 2,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('查看详情', style: TextStyle(color: Colors.blue),),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: RaisedButton.icon(
                            icon: Icon(Icons.arrow_downward),
                            label: Text('下载', style: TextStyle(fontSize: 15),),
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            onPressed: (){debugPrint('here');},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Divider(color: Colors.black26,),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.lightGreenAccent,
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  child: Center(
                    child: Text('巴拉巴历经', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 20),),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 198,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('巴拉巴历经加长看溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Container(padding: EdgeInsets.only(bottom: 4),),
                        Text('这里是介绍性文字，巴拉巴历经是一个溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(color: Colors.black38),overflow: TextOverflow.ellipsis, maxLines: 2,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('查看详情', style: TextStyle(color: Colors.blue),),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: RaisedButton.icon(
                            icon: Icon(Icons.arrow_downward),
                            label: Text('下载', style: TextStyle(fontSize: 15),),
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            onPressed: (){debugPrint('here');},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Divider(color: Colors.black26,),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: Colors.blue,
                elevation: 15.0,  //设置阴影
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  child: Center(
                    child: Text('巴拉巴历经', style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 20),),
              Container(
                height: 150,
                width: MediaQuery.of(context).size.width - 198,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('巴拉巴历经加长看溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                        Container(padding: EdgeInsets.only(bottom: 4),),
                        Text('这里是介绍性文字，巴拉巴历经是一个溢出溢出溢出溢出溢出溢出溢出溢出溢出', style: TextStyle(color: Colors.black38),overflow: TextOverflow.ellipsis, maxLines: 2,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('查看详情', style: TextStyle(color: Colors.blue),),
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          child: RaisedButton.icon(
                            icon: Icon(Icons.arrow_downward),
                            label: Text('下载', style: TextStyle(fontSize: 15),),
                            color: Colors.blue,
                            textColor: Colors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),
                            onPressed: (){debugPrint('here');},
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Divider(color: Colors.black26,),
          Container(padding: EdgeInsets.only(bottom: 10),),
          Center(
            child: RaisedButton.icon(
              label: Text('返回顶部'),
              icon: Icon(Icons.arrow_upward),
              color: Colors.white,
              elevation: 0,
              onPressed: (){debugPrint('here');},
            ),
          ),
          Container(padding: EdgeInsets.only(bottom: 10),),
        ],
      ),
    );
  }
}