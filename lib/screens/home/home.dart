import 'package:brew_team/models/brew.dart';
import 'package:brew_team/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_team/services/database.dart';
import 'package:provider/provider.dart';
import 'package:brew_team/screens/home/brew_list.dart';

/* This is the landing page after logging in
* It is called either by wrapper.dart if logged in already, 
* or signin.dart after log in*/
class Home extends StatelessWidget {
  // Initialize auth which is created in auth.dart for use in loggin out
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      // Shows bottom sheet
      showModalBottomSheet(
          context: context,
          //Returns a widget tree to show the content of the bottom sheet
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: Text('Bottom sheet'),
            );
          });
    }

    // Stream checks if there are any changes in the brew db
    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
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
                label: Text('Log out')),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('settings'),
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        // Data from the brews db shows here
        body: BrewList(),
      ),
    );
  }
}
