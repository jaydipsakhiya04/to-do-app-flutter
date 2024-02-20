// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class GoogleSignInAuth {
//   static FirebaseAuth auth = FirebaseAuth.instance;
//   static Future<User?> signInWithGoogle({required BuildContext context}) async {
//     User? user;
//
//     if (kIsWeb) {
//       GoogleAuthProvider authProvider = GoogleAuthProvider();
//
//       try {
//         final UserCredential userCredential = await auth.signInWithPopup(authProvider);
//
//         user = userCredential.user;
//       } catch (e) {
//         print(e);
//       }
//     } else {
//       final GoogleSignIn googleSignIn = GoogleSignIn();
//
//       final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//
//       final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleSignInAuthentication.accessToken,
//         idToken: googleSignInAuthentication.idToken,
//       );
//
//       try {
//         final UserCredential userCredential = await auth.signInWithCredential(credential);
//
//         user = userCredential.user;
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'account-exists-with-different-credential') {
//           // ...
//         } else if (e.code == 'invalid-credential') {
//           // ...
//         }
//       } catch (e) {
//         // ...
//       }
//     }
//
//     return user;
//   }
//
//   static Future<void> signOutGoogle({required BuildContext context}) async {
//     final GoogleSignIn googleSignIn = GoogleSignIn();
//
//     try {
//       if (!kIsWeb) {
//         await googleSignIn.signOut();
//       }
//       await auth.signOut();
//     } catch (e) {
//       //...
//     }
//   }
// }
