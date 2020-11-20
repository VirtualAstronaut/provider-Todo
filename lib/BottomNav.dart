import 'package:flutter/material.dart';
import 'BottomNavbarSample.dart';

class BottomNavExample {}

class BottomNavBarEx extends StatefulWidget {
  @override
  _BottomNavBarExState createState() => _BottomNavBarExState();
}

class _BottomNavBarExState extends State<BottomNavBarEx> {
  List<Widget> _listWidgets = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    return Scaffold(
      body: _listWidgets[_current],
      bottomNavigationBar:
          BottomNavBarSample().bottomNavigationBar(_current, (index) {
        print(index);
        setState(() {
          _current = index;
        });
        print(_current);
      }),
    );
  }
}
