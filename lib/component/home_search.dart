import 'package:flutter/material.dart';
import 'dart:async';

import '../model/search_entry.dart';
import '../component/search_manager.dart';

class HomeSearch extends StatefulWidget {
  @override
  HomeSearchState createState() => HomeSearchState();
}

class HomeSearchState extends State<HomeSearch> with SingleTickerProviderStateMixin{

  final darkText = Color.fromRGBO(0, 0, 0, 0.87);
  final _searchFocusNode = FocusNode();
  final _searchTextController = TextEditingController();
  var _isSearching = false;
  Timer _searchTimer;
  List<SearchEntry> _searchResults = List<SearchEntry>();
  
  @override
  void initState() {
    super.initState();
    _searchFocusNode.addListener(() => {
      setState((){
        _isSearching = _searchFocusNode.hasFocus;
        updateSearch();
      })
    });
  }

  updateSearch() {
    cancelSearch();
    if (!_isSearching) {
      setState(() {
        _searchResults = List<SearchEntry>();
      });
      return;
    }
    String txt = _searchTextController.text.trim();

    _searchTimer = Timer(Duration(milliseconds: txt.isEmpty ? 0 : 350), () {
      Set<SearchEntry> res = SearchManager.init().performSearch(txt);
      setState(() {
        _searchResults = res.toList();
      });
    });
  }

  cancelSearch() {
    if (_searchTimer != null && _searchTimer.isActive) {
      _searchTimer.cancel();
      _searchTimer = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.05),
          borderRadius: BorderRadius.circular(24.0),
        ),
        height: 40.0,
        child: Theme(
          data: ThemeData(
            primaryColor: darkText.withOpacity(darkText.opacity * 0.5),
          ),
          child: TextField(
            controller: _searchTextController,
            focusNode: _searchFocusNode,
            decoration: InputDecoration(
                hintText: "搜索",
                hintStyle: TextStyle(
                    fontSize: 16.0,
                    color: darkText.withOpacity(darkText.opacity * 0.5)
                ),
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchFocusNode.hasFocus
                    ? IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      _searchFocusNode.unfocus();
                      _searchTextController.clear();
                    })
                    : null,
                border: InputBorder.none),
            style: TextStyle(
              fontSize: 16.0,
              color: darkText.withOpacity(darkText.opacity),
            ),
          ),
        ),
      ),
    );
  }
}