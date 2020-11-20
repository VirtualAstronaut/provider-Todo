import 'package:flutter/material.dart';

class PriorityColors {
  List<Color> _topColors = [
    Colors.blue,
    Colors.grey,
    Colors.blueGrey,
    Colors.orange,
    Colors.red,
  ];

  List<Color> _bottomColors = [
    Colors.blue.shade700,
    Colors.grey.shade700,
    Colors.blueGrey.shade700,
    Colors.orange.shade700,
    Colors.red.shade700,
  ];

  List<Color> get topColors => _topColors;
  List<Color> get bottomColors => _bottomColors;
}
