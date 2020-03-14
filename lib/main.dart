import 'package:flutter/material.dart';
import 'screens/Screen1.dart';
void main() => runApp(MyApp());
 class MyApp extends StatelessWidget{
   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(1, 113, 118, 1),
      ),
      home: Screen1(),
    );
  }
 }