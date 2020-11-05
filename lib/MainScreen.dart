
import 'package:flutter/material.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:provider/provider.dart';
import 'AddTask.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> listToDo= [];

  @override
  void initState() {
    super.initState();
    listToDo = MyList().myList;
    MyList().addValue('value');
  }

  @override
  Widget build(BuildContext context) {
    var MylIstVar = Provider.of<MyList>(context);
    var listNew = MylIstVar.myList;
    return ChangeNotifierProvider<MyList>(
      create: (BuildContext context) => MyList(),
      builder: (context,chil){
        return Scaffold(
          floatingActionButton: FabAddTask(),
          body: Column(
            children: [
              Expanded(
                child: MylIstVar.myList != null ? ListView.builder(
                  itemCount: MylIstVar.myList.length,
                    itemBuilder: (con, index){
                      return ListTile(
                        title: Text(MylIstVar.myList[index]),
                      );
                    }) : Container(),
              ),
            ],
          ),
        );
      },

    );
  }
}

class FabAddTask extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
      child: Icon(Icons.access_alarm),
        onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (c) =>  AddTaskScreen()));
        });
  }


}