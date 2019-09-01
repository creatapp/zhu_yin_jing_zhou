import 'package:flutter/material.dart';

class HomeNavigationTextButton extends StatefulWidget {
  @override
  HomeNavigationTextButtonState createState() => HomeNavigationTextButtonState();
}

class HomeNavigationTextButtonState extends State<HomeNavigationTextButton> {

  static List<DropdownMenuItem> _dropDownMenuItemList = ['时间', '更新', '进度'].map(
      (String value) {return DropdownMenuItem(value: value,child: Text(value),);}
  ).toList();
  static String selectMenu = _dropDownMenuItemList[0].value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('占位'),
          Row(
            children: <Widget>[
              Icon(Icons.sort),
              Container(padding: EdgeInsets.only(left: 5),),
              DropdownButton(
                items: _dropDownMenuItemList,
                value: selectMenu,
                onChanged: (value){
                  setState(() {
                    selectMenu = value;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}