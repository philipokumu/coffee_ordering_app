import 'package:flutter/material.dart';
import 'package:brew_team/shared/constants.dart';

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
            decoration: textInputDecoration,
            validator: (val) => val.isEmpty ? 'Please enter a name' : null,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          SizedBox(height: 20.0),
          DropdownButtonFormField(
            // Value before or after user input i.e. includes placeholder
            value: _currentSugars ?? '0',
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
            value: (_currentStrength ?? 100).toDouble(),
            min: 100,
            max: 900,
            activeColor: Colors.brown[_currentStrength ?? 100],
            inactiveColor: Colors.brown[_currentStrength ?? 100],
            divisions: 8,
            onChanged: (val) => setState(() => _currentStrength = val.round()),
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
                print(_currentName);
                print(_currentSugars);
                print(_currentStrength);
              }),
        ],
      ),
    );
  }
}
