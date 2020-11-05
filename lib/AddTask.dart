import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListHold.dart';
class AddTaskScreen extends StatelessWidget {
  TextEditingController _taskDesc =TextEditingController();

  @override
  Widget build(BuildContext context) {
    var MylIstVar = Provider.of<MyList>(context);
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: _taskDesc,),
          RaisedButton(onPressed: (){
        MylIstVar.addValue(_taskDesc.text);
      Navigator.pop(context);
          })
        ],
      ),
    );

  }
}
