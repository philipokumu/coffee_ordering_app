import 'package:brew_team/models/user.dart';
import 'package:brew_team/screens/authenticate/authenticate.dart';
import 'package:brew_team/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/* This class listens for authentication status i.e user is logged in or not
* If logged in redirects to home.dart. If not, to authenticate.dart
* It is called by main.dart */
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    //return either home or authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
