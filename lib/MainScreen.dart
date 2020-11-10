import 'package:flutter/material.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:provider/provider.dart';

import 'SliderUpdate.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<MyList>();
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
                    child: model.myList != null
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            itemCount: model.myList.length,
                            itemBuilder: (con, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  children: [
                                    Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(10),
                                                topRight: Radius.circular(10))),
                                        width: MediaQuery.of(con).size.width,
                                        height: 125,
                                        child: Text(
                                          model.myList[index],
                                          style: TextStyle(
                                              fontSize: 25, color: Colors.white),
                                        )),
                                    Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        decoration: BoxDecoration(
                                            color: Colors.blue.shade800,
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(10),
                                                bottomRight:
                                                    Radius.circular(10))),
                                        width: MediaQuery.of(con).size.width,
                                        height: 35,
                                        child: Text(
                                          "Priority " +
                                              model.priority[index].toString(),
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.white),
                                          textAlign: TextAlign.justify,
                                        ))
                                  ],
                                ),
                              );
                            })
                        : Container(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
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
    var query = MediaQuery.of(context).size;
    return AlertDialog(
      title: Text('Add Todo'),
      content: Container(
        height: query.height / 4,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _todoText,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  labelText: RandomWords().getRandomWord()),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('Priority')),
            Container(
              margin: EdgeInsets.symmetric(),
              child: Consumer<SliderUpdate>(
                builder: (context, model, child) {
                  return Slider(
                      value: model.sliderValue,
                      divisions: 4,
                      min: 1,
                      max: 5,
                      label: model.sliderValue.toString(),
                      onChanged: (value) {
                        model.updateValue(value);
                      });
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        FlatButton(
            onPressed: () {
              var model = context.read<MyList>();
              var listModel = context.read<SliderUpdate>().sliderValue;
              model.addValue(_todoText.text, listModel.round());
              Navigator.pop(context);
            },
            child: Text('ADD'))
      ],
    );
  }
}
