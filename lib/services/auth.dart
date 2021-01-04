import 'package:brew_team/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

/* This class is called from the sign in. It handles fetching auth info from firebase 
*It is called by sign_in.dart*/
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create user object based on firebase user
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  //auth change user stream. For listening to change in the authentication.
  //Since stream does not return <FirebaseUser> i.e (because we have mapped), we change type to local <User>
  Stream<User> get user {
    //on change in auth, return a firebase user.
    //Then map to local user object since we dont need all the firebase user object info
    return _auth.onAuthStateChanged
        // .map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Sign in with email and password

  // Register in with email and password

  //Sign out

}
