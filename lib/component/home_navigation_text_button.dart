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
          Row(
            children: <Widget>[
              Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(left: 0),
                    child: Text('本地', style: TextStyle(color: Colors.black, fontSize: 30),),
                    onPressed: (){debugPrint('');},
                    textColor: Colors.black,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    height: 5,
                    width: 60,
                  )
                ],
              ),
              Container(padding: EdgeInsets.only(left: 0),),
              Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('线上', style: TextStyle(color: Colors.black38, fontSize: 20),),
                    onPressed: (){debugPrint('');},
                    textColor: Colors.black,
                  ),
                  Container()
                ],
              )
            ],
          ),
          DropdownButton(
            items: _dropDownMenuItemList,
            value: selectMenu,
            onChanged: (value){
              setState(() {
                selectMenu = value;
              });
            },
            icon: Icon(Icons.arrow_downward),
            iconSize: 20,
          )
        ],
      ),
    );
  }
}