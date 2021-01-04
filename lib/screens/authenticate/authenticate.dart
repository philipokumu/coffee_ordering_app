import 'package:brew_team/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

/* This class controls the authentication i.e user sign in or register
* It is called by wrapper.dart */
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignIn(),
    );
  }
}
