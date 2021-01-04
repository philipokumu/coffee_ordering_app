import 'package:brew_team/screens/wrapper.dart';
import 'package:flutter/material.dart';

/*This is the root class that holds every element. 
*It is called when user opens the app*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Wrapper(),
    );
  }
}
