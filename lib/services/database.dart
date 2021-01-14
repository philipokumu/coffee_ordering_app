import 'package:brew_team/models/brew.dart';
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

  // brew list from brew db snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Brew(
        name: doc.data['name'] ?? '',
        sugars: doc.data['sugars'] ?? 0,
        strength: doc.data['strength'] ?? 0,
      );
    }).toList();
  }

  //Get brews database stream
  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
