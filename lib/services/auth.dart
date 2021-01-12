import 'package:brew_team/models/user.dart';
import 'package:brew_team/services/database.dart';
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
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      // The promise return a firebase user with info we dont need
      FirebaseUser user = result.user;

      // We thus take the firebase user and creat a user model with only the info we need
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register in with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // The promise return a firebase user with info we dont need
      FirebaseUser user = result.user;

      // Create a new document for the user with the uid and dummy data
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);

      // We thus take the firebase user and creat a user model with only the info we need
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString);
      return null;
    }
  }
}
