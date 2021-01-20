import 'package:brew_team/models/user.dart';
import 'package:brew_team/services/database.dart';
import 'package:brew_team/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:brew_team/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //Form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // We are populating data already in this user's document in the form
    return StreamBuilder<UserData>(
        // The stream is from database.dart
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Text(
                    'Update your brew settings.',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    initialValue: userData.name,
                    decoration: textInputDecoration,
                    validator: (val) =>
                        val.isEmpty ? 'Please enter a name' : null,
                    onChanged: (val) => setState(() => _currentName = val),
                  ),
                  SizedBox(height: 20.0),
                  DropdownButtonFormField(
                    // Value before or after user input i.e. includes placeholder
                    value: _currentSugars ?? userData.sugars,
                    decoration: textInputDecoration,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        // current sugar we are iterating
                        value: sugar,
                        // for example: 2 sugars
                        child: Text('$sugar sugars'),
                      );
                      // Convert from iterable to list
                    }).toList(),
                    onChanged: (val) => setState(() => _currentSugars = val),
                  ),
                  Slider(
                    value: (_currentStrength ?? userData.strength).toDouble(),
                    min: 100,
                    max: 900,
                    activeColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    inactiveColor:
                        Colors.brown[_currentStrength ?? userData.strength],
                    divisions: 8,
                    onChanged: (val) =>
                        setState(() => _currentStrength = val.round()),
                  ),
                  SizedBox(height: 10.0),
                  // Dropdown
                  // Slider
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          await DatabaseService(uid: user.uid).updateUserData(
                              _currentSugars ?? userData.sugars,
                              _currentName ?? userData.name,
                              _currentStrength ?? userData.strength);
                          Navigator.pop(context);
                        }
                      }),
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}
