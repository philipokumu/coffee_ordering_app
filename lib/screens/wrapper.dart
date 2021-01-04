import 'package:brew_team/screens/authenticate/authenticate.dart';
import 'package:brew_team/screens/home/home.dart';
import 'package:flutter/material.dart';

/* This class listens for authentication status i.e user is logged in or not
* If logged in redirects to home.dart. If not, to authenticate.dart
* It is called by main.dart */
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widget
    return Authenticate();
  }
}
