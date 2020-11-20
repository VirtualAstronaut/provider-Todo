import 'package:flutter/material.dart';

class BottomNavBarSample {
  BottomNavigationBar bottomNavigationBar(int _index, Function(int) ontap) {
    print(_index);
    return BottomNavigationBar(
      currentIndex: _index,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.sticky_note_2), label: 'ok'),
        BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined), label: 'ok'),
        BottomNavigationBarItem(
            icon: Icon(Icons.sticky_note_2_outlined), label: 'ok2')
      ],
      onTap: ontap,
    );
  }
}
