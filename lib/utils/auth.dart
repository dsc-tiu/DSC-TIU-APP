import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth extends ChangeNotifier {
  //Creating Singleton class
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  void _setState(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  //Gets current logged in user else return null
  Future<FirebaseUser> getCurrentUser() async =>
      await _firebaseAuth.currentUser();
  //Sign in user with google account
  Future<void> googleSignIn() async {
    _setState(true);
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final FirebaseUser user =
          (await _firebaseAuth.signInWithCredential(credential)).user;
      _setState(false);
      print("signed in " + user.displayName);
      return user;
    } catch (e) {
      _setState(false);
    }
  }

  //Signs out user from the app
  Future<void> signOut() async => await _firebaseAuth.signOut();
}
