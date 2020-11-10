import 'package:flutter/material.dart';
import 'package:flutter_app/BottomNav.dart';
import 'package:flutter_app/ListHold.dart';
import 'package:flutter_app/MainScreen.dart';
import 'package:flutter_app/SliderUpdate.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyList()),
      ChangeNotifierProvider(create: (_) => SliderUpdate())],
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
