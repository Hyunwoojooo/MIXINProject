import 'package:flutter/material.dart';

class SlidePage extends StatefulWidget {
  @override
  _SlidePageState createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slide Page'),
      ),
      body: Column(
        children: [
          Container(
            child: Text('1'),
          ),
          Container(
            child: Text('2'),
          ),
          Container(
            child: Text('3'),
          )
        ],
      )
    );
  }
}
