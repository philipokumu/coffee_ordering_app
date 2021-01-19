/*This class will use data from firebase user object authentication to create a local user object.
* The local user object enables us to collect only information, 
* that we need from firebase and not all of the unneeded data.
* We can then use this information in our */
class User {
  final String uid;

  User({this.uid});
}

// Similar to brew model, however, brew model has no uid
// Preferrable to create a new model for easy extendability of independent models
class UserData {
  final String uid;
  final String name;
  final String sugars;
  final int strength;

  UserData({this.uid, this.name, this.sugars, this.strength});
}
