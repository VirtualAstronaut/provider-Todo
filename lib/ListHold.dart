import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
class MyList extends ChangeNotifier {
  List<String> _myList = [];
  addValue(String value){
    _myList.add(value);
    notifyListeners();
  }
  List<String> get myList => _myList;
  removeValue(int index){
    myList.removeAt(index);
    notifyListeners();
  }
}

class RandomWords {
  List<String> _words = ['Write Your Next Goal',
  'Finish What You Added',
  'Time To Work',
  'Do not Procrastinate'];

  getRandomWord(){
    return _words[Random().nextInt(4)];
  }
}