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
    return Scaffold(
      floatingActionButton: FabAddTask(),
      body: Column(
        children: [
          Expanded(
              child: ChangeNotifierProvider<MyList>(
            create: (BuildContext context) => MyList(),
            child: MylIstVar.myList != null
                ? ListView.builder(
                    itemCount: MylIstVar.myList.length,
                    itemBuilder: (con, index) {
                      return ListTile(
                        title: Text(MylIstVar.myList[index]),
                      );
                    })
                : Container(),
          )),
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
              var myList = Provider.of<MyList>(context,listen: false);
              myList.addValue(_todoText.text);
              Navigator.pop(context);
            },
            child: Text('ADD'))
      ],
    );
  }
}
