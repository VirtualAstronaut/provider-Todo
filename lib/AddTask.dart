import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ListHold.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController _taskDesc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var MylIstVar = Provider.of<MyList>(context);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _taskDesc,
                decoration: InputDecoration(hintText: 'Task'),
              )),
          RaisedButton(
            onPressed: () {
              MylIstVar.addValue(_taskDesc.text);
              Navigator.pop(context);
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
