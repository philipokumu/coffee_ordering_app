import 'package:flutter/material.dart';

/* This is the landing page after logging in
* It is called either by wrapper.dart if logged in already, 
* or signin.dart after log in*/
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Home'),
    );
  }
}
