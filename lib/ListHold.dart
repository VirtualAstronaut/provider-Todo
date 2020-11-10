import 'dart:core';
import 'dart:core';
import 'dart:math';


import 'package:flutter/foundation.dart';
class MyList extends ChangeNotifier {
  List<String> _myList = [];
  List<int>  _priority = [];
  List<int> get priority => _priority;
  List<String> get myList => _myList;

  addValue(String task,int priority){
    _myList.add(task);
    _priority.add(priority);
    notifyListeners();
  }

  removeValue(int index){
    myList.removeAt(index);
    priority.removeAt(index);
    notifyListeners();
  }
}

class RandomWords {
  List<String> _words = [
    'Write Your Next Goal',
  'Finish What You Added',
  'Time To Work',
  'Do not Procrastinate'];

  getRandomWord(){
    return _words[Random().nextInt(4)];
  }
}