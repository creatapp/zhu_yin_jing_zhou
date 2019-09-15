import 'package:flutter/material.dart';

class Reader extends StatefulWidget {
  @override
  ReaderState createState() => ReaderState();
}

class ReaderState extends State<Reader> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
      body: Center(child: Text('reader'),),
    );
  }
}