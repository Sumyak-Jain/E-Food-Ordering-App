import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Authentication with ChangeNotifier {
  String uid, userEmail;
  String get getUid => uid;
  String get getUserEmail => userEmail;

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future loginIntoAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    userEmail = user.email;

    print('This is out uid => $getUid');
    notifyListeners();
  }

  Future createNewAccount(String email, String password) async {
    UserCredential userCredential = await firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password);
    User user = userCredential.user;
    uid = user.uid;
    print('This is out uid => $getUid');
    notifyListeners();
  }
}
