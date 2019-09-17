import 'package:flutter/material.dart';

import 'package:zhu_yin_jing_zhou/component/expandable_card.dart';

class CangJingGe extends StatefulWidget {
  @override
  CangJingGeState createState() => CangJingGeState();
}

class CangJingGeState extends State<CangJingGe> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: List.filled(10, ExpandableCard()),
    );
  }
}