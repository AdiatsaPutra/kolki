part of 'services.dart';

class AuthServices {
  static auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String getUserId() {
    return _auth.currentUser.uid;
  }

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);

      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      auth.UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<auth.User> get userStream => _auth.authStateChanges();
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}

class FirebaseServices {
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String get productId => null;

  String getUserId() {
    return _firebaseAuth.currentUser.uid;
  }

  final CollectionReference tvRef = FirebaseFirestore.instance.collection("tv");
  final CollectionReference hatiRef =
      FirebaseFirestore.instance.collection("Hati");
  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection("Buku");
  final CollectionReference anakRef =
      FirebaseFirestore.instance.collection("Anak");
  final CollectionReference manhajRef =
      FirebaseFirestore.instance.collection("Manhaj");
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference semuaRef =
      FirebaseFirestore.instance.collection("Semua");
}
