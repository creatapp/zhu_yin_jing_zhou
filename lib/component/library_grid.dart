import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/gestures.dart';

import '../model/book_item.dart';
import 'title.dart';

class LibraryGrid extends StatefulWidget {
  @override
  LibraryGridState createState() => LibraryGridState(_scrollController);

  final ScrollController _scrollController;

  LibraryGrid(this._scrollController);
}

class LibraryGridState extends State<LibraryGrid> {
  LibraryGridState(this._scrollController);

  final ScrollController _scrollController;
  final rowCnt = 3;
  List<Object> _bookItemList = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 30; i++) {
      _bookItemList.add(_getRandomItem());
    }

    _scrollController.addListener((){
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent) {
        _retrieveData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _retrieveData() async {
    Future.delayed(Duration(milliseconds: 100)).then((e) {
//      setState(() {
//        //重新构建列表
//        _getBookItem();
//      });
    });
  }

  _getRandomItem () => BookItem('0', '巴拉巴拉经加长加长看溢出溢出', '巴拉巴拉法师名字很长很长', 1.0, '这是一段很长很长的介绍文， 可能已经提前排好版本了的', '', 0, BookItemEnum.downloadable);


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _retrieveData,
        child: Scrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: _bookItemList.length,
            itemBuilder: (context, index) {
              if (index == 0) return HomeTitle();
              if (index % 4 == 1) return Container(
                  padding: EdgeInsets.only(top: 20, left: 25, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Icon(Icons.remove_circle_outline, color: Colors.deepOrangeAccent,),
                      Container(padding: EdgeInsets.only(left: 10),),
                      Text('导航文字', style: TextStyle(fontSize: 18),),
                    ],
                  )
              );
              return _getRow(List.filled(3, _bookItemList[index]));
            },
            controller: _scrollController,
          ),
        )
    );
  }

  Widget _getRow(List<BookItem> bookItems) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _getGrid(bookItems[0]),
        _getGrid(bookItems[1]),
        _getGrid(bookItems[2]),
      ],
    );
  }
  
  Widget _getGrid(BookItem bookItem) {
    return GestureDetector(
      child: Container(
        width: 90,
        height: 200,
        child: Column(
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
                              width: 82,
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
                                  Container(padding: EdgeInsets.only(right: 10),),
                                  Text('早', style: TextStyle(color: Colors.deepOrange),)
                                ],
                              )
                          )
                      )
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                '经文加长加长版名字很长，测试溢出，应该不会溢出',
                style: TextStyle(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
      onTap: (){showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          contentPadding: EdgeInsets.symmetric(
              horizontal: 25),
          title: Text('经咒详情'),
          backgroundColor: Colors.white
              .withOpacity(0.8),
          children: <Widget>[
            Divider(height: 5,),
            Container(padding: EdgeInsets.only(
                bottom: 30),),
            Container(
              height: 100,
              width: 500,
              child: Card(
                color: Colors.brown,
              ),
            ),
            Text(bookItem.name, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold),),
            Container(padding: EdgeInsets.only(
                bottom: 20),),
            Text(bookItem.intro),
            Container(padding: EdgeInsets.only(
                bottom: 50),),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                      text: '取消',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.of(context)
                              .pop();
                        },
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15)
                  ),
                ),
                RichText(
                    text: TextSpan(
                        text: '确定',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context)
                                .pop();
                          },
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 15)
                    )
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                  bottom: 20),
            )
          ],
        )
      );},
    );
  }
}