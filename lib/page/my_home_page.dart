import 'dart:ui';

import 'package:flutter/material.dart';

import '../component/search.dart';
import '../component/library_list.dart';
import '../component/bottom_floating_navigation.dart';
import '../constant/theme.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  final MyTheme myTheme = MyTheme.getInstance();
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(left: 25, right: 25),
                child: LibraryList(),
              ),
              BottomFloatingNavigation()
            ],
          ),
          Stack(
            children: <Widget>[
              LibraryList(),
              BottomFloatingNavigation()
            ],
          ),
          Stack(
            children: <Widget>[
              LibraryList(),
              BottomFloatingNavigation()
            ],
          ),
        ],
      ),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: 150,
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: '本地',
                  ),
                  Tab(
                    text: '线上',
                  ),
                  Tab(
                    text: '功课',
                  ),
                ],
                controller: _tabController,
                indicatorColor: Colors.deepOrangeAccent,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                indicatorPadding: EdgeInsets.all(0),
                labelPadding: EdgeInsets.all(0),
                unselectedLabelColor: Colors.black26,
                unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
              ),
            ),
            HomeSearch()
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
    );
  }
}