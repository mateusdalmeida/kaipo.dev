import 'package:flutter/material.dart';
import 'package:kaipodev/ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'kaipo',
      theme: ThemeData(fontFamily: "QuickSand", primarySwatch: Colors.grey),
      home: MyHomePage(),
    );
  }
}
