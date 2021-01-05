import 'package:brew_team/models/user.dart';
import 'package:brew_team/screens/wrapper.dart';
import 'package:brew_team/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*This is the root class that holds every element. 
*It is called when user opens the app*/

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
