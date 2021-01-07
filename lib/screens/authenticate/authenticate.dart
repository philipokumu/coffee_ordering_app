import 'package:brew_team/screens/authenticate/register.dart';
import 'package:brew_team/screens/authenticate/sign_in.dart';
// import 'package:brew_team/screens/authenticate/sign_in.dart';
import 'package:flutter/material.dart';

/* This class controls the authentication i.e user sign in or register
* It is called by wrapper.dart */
class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  // State for switching from register to sign in screen and vice versa
  bool showSignIn = true;

  // We pass this down to the sign in and register dart files
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      // We pass the void function for use into the individual dart files
      return SignIn(toggleView: toggleView);
    } else {
      return Register(toggleView: toggleView);
    }
  }
}
