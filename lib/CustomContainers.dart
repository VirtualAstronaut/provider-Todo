import 'package:flutter/material.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:provider/provider.dart';
import 'RandomColors.dart';

class CustomContainer extends StatelessWidget {
  final String _task;
  final int _priority;
  final double _width;
  final int _index;
  CustomContainer(this._task, this._priority, this._width, this._index);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: PriorityColors().topColors[_priority - 1],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              width: _width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _task,
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      context.read<MyList>().removeValue(_index);
                    },
                  )
                ],
              )),
          Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: PriorityColors().bottomColors[_priority - 1],
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              width: _width,
              child: Text(
                "Priority " + _priority.toString(),
                style: TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.justify,
              ))
        ],
      ),
    );
  }
}
