import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthRepository {
  Future<UserCredential> loginWithGmail() async {
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Stream<User?> authChangeListener() {
    return FirebaseAuth.instance.authStateChanges();
  }
}
