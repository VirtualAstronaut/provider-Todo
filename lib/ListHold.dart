import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class MyList extends ChangeNotifier {
  List<String> _myList = ["boom"];

  addValue(String value){
    _myList.add(value);
    notifyListeners();
  }

  List<String> get myList => _myList;
}