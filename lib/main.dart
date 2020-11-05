import 'package:flutter/material.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:flutter_app/MainScreen.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyList>(
      create: (c) => MyList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
