part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  static FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection("Products");

  static Future<void> updateUser(User user) async {
    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguage': user.selectedLanguage,
      'profilePicture': user.profilePicture ?? "",
      'creationTime': user.creationTime
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(id, snapshot.data()['email'],
        balance: snapshot.data()['balance'],
        profilePicture: snapshot.data()['profilePicture'],
        selectedGenres: (snapshot.data()['selectedGenres'] as List)
            .map((e) => e.toString())
            .toList(),
        selectedLanguage: snapshot.data()['selectedLanguage'],
        name: snapshot.data()['name'],
        creationTime: snapshot.data()['creationTime']);
  }

  /*static Future<void> addMyCoin(User user) async {
    await _userCollection.doc(user.id).update({
      'balance': user.balance,
    });
  }*/
  static Future<void> addMyCoin(User user) async {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"balance": user.balance});
  }

  static FirebaseServices _firebaseServices = FirebaseServices();

  //setvice get ticket
  /*  static Future<void> calculateMyCoin(User user) async {
    await _userCollection.doc(user.id).update({
      'balance': user.balance,
    });
  }*/

  static Future<void> calculateMyCoin(User user) async {
    return _firebaseServices.usersCollection
        .doc(_firebaseServices.getUserId())
        .update({"balance": user.balance});
  }
}
