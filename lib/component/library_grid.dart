import 'package:flutter/material.dart';
import 'dart:math';

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

  _getRandomItem () => BookItem('巴拉巴拉经加长加长看溢出溢出', '巴拉巴拉法师名字很长很长', 1.0, '这是一段很长很长的介绍文， 可能已经提前排好版本了的', '', 0, BookItemEnum.downloadable);


  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: _retrieveData,
        child: Scrollbar(
          child: GridView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 25),
            itemCount: _bookItemList.length,
            itemBuilder: (context, index) {
              return _getBookLibrary(_bookItemList[index]);
            },
            controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 50,
              crossAxisSpacing: 35,
              childAspectRatio: 0.75,
            ),
          ),
        )
    );
  }

  Widget _getBookLibrary(BookItem bookItem) {
    var randomColor = Colors.deepOrange;
    return Container(
      width: 90,
      height: 350,
      child: Column(
        children: <Widget>[
          Card(
            color: randomColor,
            elevation: 15.0, //设置阴影
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15.0))), //设置圆角
            child: Container(
              height: 120,
              width: 90,
              padding: EdgeInsets.all(10),
            ),
          ),
          Text('经文加长加长版名字很长，测试溢出，应该不会溢出')
        ],
      ),
    );
  }
}