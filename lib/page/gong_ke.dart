import 'package:flutter/material.dart';
import 'package:zhu_yin_jing_zhou/component/library_list.dart';
import 'package:zhu_yin_jing_zhou/component/library_grid.dart';

class Gongke extends StatefulWidget {
  @override
  GongKeState createState() => GongKeState();
}

class GongKeState extends State<Gongke> {

  final ScrollController _scrollController = ScrollController(initialScrollOffset: 0, keepScrollOffset: true);
  bool _isDisplayNavTool = false;

@override
void initState() {
  super.initState();

  _scrollController.addListener((){
    if (_scrollController.offset > 100 && !_isDisplayNavTool) {
      setState(() {
        _isDisplayNavTool = true;
      });
    } else if (_scrollController.offset < 100 && _isDisplayNavTool){
      setState(() {
        _isDisplayNavTool = false;
      });
    }
//      debugPrint(_scrollController.offset.toString());
  });
}

@override
void dispose() {
  super.dispose();
  _scrollController.dispose();
}

  @override
  Widget build(BuildContext context) {
    return LibraryGrid(_scrollController);
  }
}