import 'package:flutter/material.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:provider/provider.dart';
import 'AddTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listToDo = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var MylIstVar = Provider.of<MyList>(context);
    var checked = false;
    return Scaffold(
      floatingActionButton: FabAddTask(),
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            child: Text(
              'To-Do List',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            margin: EdgeInsets.only(top: 50),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topLeft: Radius.circular(75.0)),
                  color: Colors.white),
              child: Column(
                children: [
                  Expanded(
                      flex: 4,
                      child: ChangeNotifierProvider<MyList>(
                        create: (BuildContext context) => MyList(),
                        child: MylIstVar.myList != null
                            ? ListView.builder(
                                padding: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
                                itemCount: MylIstVar.myList.length,
                                itemBuilder: (con, index) {
                                  return ListTile(
                                      leading: CircleAvatar(
                                          child: Text(
                                        (index + 1).toString(),
                                      )),
                                      title: Text(MylIstVar.myList[index]),
                                      trailing: StatefulBuilder(
                                          builder: (con, setState) {
                                        var _showCheckBox = 0.0;
                                        return Opacity(
                                          opacity: _showCheckBox,
                                          child: Checkbox(
                                            value: checked,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checked = !checked;
                                              });
                                            },
                                          ),
                                        );
                                      }));
                                })
                            : Container(),
                      )),
                  FlatButton(onPressed: () {}, child: Text('Remove'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FabAddTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showDialog(context: context, builder: (con) => AddToDo());
        });
  }
}

class AddToDo extends StatelessWidget {
  final TextEditingController _todoText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Todo'),
      content: TextField(
        controller: _todoText,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelText: RandomWords().getRandomWord()),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              var myList = Provider.of<MyList>(context, listen: false);
              myList.addValue(_todoText.text);
              Navigator.pop(context);
            },
            child: Text('ADD'))
      ],
    );
  }
}
