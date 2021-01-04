/*This class will use data from firebase user object authentication to create a local user object.
* The local user object enables us to collect only information, 
* that we need from firebase and not all of the unneeded data.
* We can then use this information in our*/
class User {
  final String uid;

  User({this.uid});
}
