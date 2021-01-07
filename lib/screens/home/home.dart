import 'package:brew_team/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_team/services/auth.dart';

/* This is the landing page after logging in
* It is called either by wrapper.dart if logged in already, 
* or signin.dart after log in*/
class Home extends StatelessWidget {
  // Initialize auth which is created in auth.dart for use in loggin out
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Brew team'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                // Signout on clicking this button
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Log out'))
        ],
      ),
    );
  }
}
