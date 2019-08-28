import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:math';

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
      child: _getBookLibraryList(),
    );
  }

  Widget _getBookLibraryList () {
    int length = 20;
    var nameList = List<String>.filled(length, '巴拉巴拉经加长版为了测试溢出');
    var introList = List<String>.filled(length, '这里是介绍性文字，巴拉巴历经为了测试溢出为了测试溢出为了测试溢出');
    var idList = List<int>.generate(length, (i){return i;}, growable: true);
    final Random random = Random();
    var colorList = List<Color>.generate(length, (i){return Color.fromARGB(random.nextInt(255),
        random.nextInt(255), random.nextInt(255), random.nextInt(255));});

    List<Widget> _arr = List<Widget>.filled(length * 4 + 2, null);
    for (int i = 0; i < length; i++) {
      _arr[4 * i] = Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            color: colorList[i],
            elevation: 15.0,  //设置阴影
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15.0))),  //设置圆角
            child: Container(
              height: 150,
              width: 120,
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(nameList[i], style: TextStyle(fontSize: 20, color: Colors.black),),
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
                    Text(nameList[i], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),maxLines: 2,overflow: TextOverflow.ellipsis,),
                    Container(padding: EdgeInsets.only(bottom: 4),),
                    Text(introList[i], style: TextStyle(color: Colors.black38),overflow: TextOverflow.ellipsis, maxLines: 2,),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: '详情',
                        style: TextStyle(fontSize: 15, color: Colors.yellow),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    contentPadding: EdgeInsets.symmetric(horizontal: 25),
                                    title: Text('经咒详情'),
                                    backgroundColor: Colors.white.withOpacity(0.8),
                                    children: <Widget>[
                                      Divider(height: 5,),
                                      Container(padding: EdgeInsets.only(bottom: 30),),
                                      Container(
                                        height: 100,
                                        width: 500,
                                        child: Card(
                                          color: Colors.yellow,
                                        ),
                                      ),
                                      Text('巴拉巴拉经', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                      Container(padding: EdgeInsets.only(bottom: 20),),
                                      Text('介绍文字' * 20),
                                      Container(padding: EdgeInsets.only(bottom: 50),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          RichText(
                                            text : TextSpan(
                                                  text: '取消',
                                                  recognizer: TapGestureRecognizer()..onTap = (){Navigator.of(context).pop();},
                                                  style: TextStyle(color: Colors.blue, fontSize: 15)
                                            ),
                                          ),
                                          RichText(
                                              text : TextSpan(
                                                  text: '确定',
                                                  recognizer: TapGestureRecognizer()..onTap = (){Navigator.of(context).pop();},
                                                  style: TextStyle(color: Colors.blue, fontSize: 15)
                                              )
                                          ),
                                        ],
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                      )
                                    ],
                                  );
                                }
                            );
                          }
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      child: OutlineButton(
                        padding: EdgeInsets.all(0),
                        child: Text('下载', style: TextStyle(fontSize: 15, color: Colors.yellow),),
                        color: Colors.yellow,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        onPressed: (){debugPrint('here');},
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      );
      _arr[4 * i + 1] = Container(padding: EdgeInsets.only(bottom: 10),);
      _arr[4 * i + 2] = Divider(color: Colors.black26,);
      _arr[4 * i + 3] = Container(padding: EdgeInsets.only(bottom: 10),);
    }

    _arr[4 * length] = Center(
      child: RaisedButton.icon(
        label: Text('返回顶部'),
        icon: Icon(Icons.arrow_upward),
        color: Colors.white,
        elevation: 0,
        onPressed: (){debugPrint('here');},
      ),
    );
    _arr[4 * length + 1] = Container(padding: EdgeInsets.only(bottom: 10),);

    return Column (
      children: _arr,
    );
  }


}