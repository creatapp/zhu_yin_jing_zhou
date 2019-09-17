import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

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
    Future.delayed(Duration(milliseconds: 500)).then((e) {
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

  _getRandomItem () => BookItem('0', '巴拉巴拉经加长加长看溢出溢出', '巴拉巴拉法师名字很长很长', 1.0, '这是一段很长很长的介绍文， 可能已经提前排好版本了的', '', 0, BookItemEnum.downloadable);

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
                          Text('导航文字', style: TextStyle(fontSize: 18),),
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

    return Column(
      children: <Widget>[
        Container(padding: EdgeInsets.only(top: 15),),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
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
                                      child: Text('点击下载', style: TextStyle(color: Colors.deepOrange),),
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
                        Text(bookItem.name, style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('译者  ', style: TextStyle(color: Colors.black38),),
                            Text(bookItem.interpreter,
                              style: TextStyle(color: Colors.black38),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                          ],
                        )
                      ],
                    ),
                    Text(bookItem.intro,
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
  }
}