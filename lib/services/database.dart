import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  // property
  final String uid;

  // constructor
  DatabaseService({this.uid});
  // collection reference
  // This is the database in other words
  final CollectionReference brewCollection =
      Firestore.instance.collection('brews');

  // Creates a new user using uid in the database with an empty record/document
  // Also updates the users data in the db
  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection.document(uid).setData({
      'sugars': sugars,
      'name': name,
      'strength': strength,
    });
  }
}
