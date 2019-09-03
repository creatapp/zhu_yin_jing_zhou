import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:zhu_yin_jing_zhou/component/title.dart';
import 'package:zhu_yin_jing_zhou/model/book_item.dart';

class LibraryList extends StatefulWidget {
  @override
  LibraryListState createState() => LibraryListState(_scrollController);

  final ScrollController _scrollController;

  LibraryList(this._scrollController);
}

class LibraryListState extends State<LibraryList> {
  List<Object> _bookItemList = [];
  final ScrollController _scrollController;

  LibraryListState(this._scrollController);

  @override
  void initState() {
    super.initState();
    _bookItemList.add(null);
    _addBookItem(10);

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
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _addBookItem(3);
      });
    });
  }

  _addBookItem (int length) {
    for (int i = 0; i < 3; i++) {
      _bookItemList.add(_getRandomItem());
    }
  }

  _getRandomItem () => BookItem('巴拉巴拉经加长加长看溢出溢出', '巴拉巴拉法师名字很长很长', 1.0, '这是一段很长很长的介绍文， 可能已经提前排好版本了的', '', 0, BookItemEnum.downloadable);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _retrieveData,
      child: Scrollbar(
        child: ListView.separated(
          itemCount: _bookItemList.length,
          itemBuilder: (context, index) {

            if (index == 0) {
              return HomeTitle();
            }

            if (index >= _bookItemList.length - 1) {
              _retrieveData();

              return Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2,),
                ),
              );
            }

            if (index % 4 == 1) {
              return Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.only(top: 20, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.remove_circle_outline, color: Colors.deepOrangeAccent,),
                          Container(padding: EdgeInsets.only(left: 10),),
                          Text('导航文字', style: TextStyle(fontSize: 22),),
                        ],
                      )
                  ),
                  _getBookLibrary(_bookItemList[index]),
                ],
              );
            }

            return _getBookLibrary(_bookItemList[index]);
          },

          separatorBuilder: (context, index) => Divider(height: 10),
          controller: _scrollController,
        ),
      )
    );
  }

  Widget _getBookLibrary(BookItem bookItem) {
    var randomColor = Colors.deepOrange;

    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.only(top: 15),),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Card(
                color: randomColor,
                elevation: 15.0, //设置阴影
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))), //设置圆角
                child: Container(
                  height: 150,
                  width: 120,
                  padding: EdgeInsets.all(10),
//                  child: Center(
//                    child: Text(bookItem.name,
//                      style: TextStyle(fontSize: 18, color: Colors.black),),
//                  ),
                ),
              ),
              Container(padding: EdgeInsets.only(left: 20),),
              Container(
                height: 150,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 198,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(bookItem.name, style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        Container(padding: EdgeInsets.only(bottom: 8),),
                        Text(bookItem.interpreter,
                          style: TextStyle(color: Colors.black38),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,),
                        Container(padding: EdgeInsets.only(bottom: 8),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                              text: '详情',
                              style: TextStyle(
                                  fontSize: 15, color: Colors.deepOrangeAccent),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return SimpleDialog(
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
                            child: Text('下载', style: TextStyle(fontSize: 15,
                                color: Colors.deepOrangeAccent),),
                            color: Colors.deepOrangeAccent,
                            textColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            onPressed: () {
                              debugPrint('here');
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Container(padding: EdgeInsets.only(top: 15),),
      ],
    );
  }
}