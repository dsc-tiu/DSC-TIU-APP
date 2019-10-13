import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  //Creating Singleton class
  static final Auth _singleton = Auth._internal();
  factory Auth() => _singleton;
  Auth._internal();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    // scopes: <String>[
    //   'email',
    //   'profile',
    // ],
  );
  //Gets current logged in user else return null
  Future<FirebaseUser> getCurrentUser() async =>
      await _firebaseAuth.currentUser();
  //Sign in user with google account
  Future<FirebaseUser> googleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final FirebaseUser user =
        (await _firebaseAuth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  //Signs out user from the app
  Future<void> signOut() async => await _firebaseAuth.signOut();
}
