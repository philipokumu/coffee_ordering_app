import 'package:brew_team/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:brew_team/shared/constants.dart';

/* This class handles user signin. 
*It is called by authenticate.dart*/
class SignIn extends StatefulWidget {
  // We declare the toggleView function
  final Function toggleView;

  // The constructor then imports the toggleView function from authenticate.dart
  // to the local toggleView property
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //_auth is called from auth.dart
  final AuthService _auth = AuthService();

  // A key to identify our form and it is associated to the global Formstate key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Declare error variable
  String error = '';

  // Declare states for the email and password fields for holding the data
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew team'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed: () {
              //Assign the toggleView to the sign in button
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 20.0),
        // Form for signing in
        child: Form(
          // Keeps track the state of our form and help validate it
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              // For email input
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                // Validator property to validate the text field
                // when we click submit
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 20.0),
              // For password input
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                // Validator property to validate the text field
                // when we click submit
                validator: (val) =>
                    val.length < 6 ? 'Enter a password 6+ chars long' : null,
                obscureText: true,
                onChanged: (val) {
                  //Set the value to be the entered detail
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  // Validates our form based on current form based at the
                  // point we click the button
                  if (_formKey.currentState.validate()) {
                    // we use dynamic since the info we await to be returned
                    // can be null or a user

                    dynamic result =
                        _auth.signInWithEmailAndPassword(email, password);

                    if (result == null) {
                      setState(() =>
                          error = 'Could not sign in with those credentials');
                      // Else if successfull, the stream that is listening for changes
                      // in the wrapper will redirect us to the home page
                    }
                  }
                },
              ),
              SizedBox(height: 12.0),
              Text(
                error,
                style: TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
