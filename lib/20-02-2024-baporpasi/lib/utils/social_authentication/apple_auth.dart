// import 'dart:convert';
// import 'dart:math';
//
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';
//
// class AppleSignInAuth {
//   static final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
//
//   static Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
//
//   static Future<void> signOut() async {
//     await _firebaseAuth.signOut();
//   }
//
//   /// Generates a cryptographically secure random nonce, to be included in a
//   /// credential request.
//   static String generateNonce([int length = 32]) {
//     const charset = '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
//     final random = Random.secure();
//     return List.generate(length, (_) => charset[random.nextInt(charset.length)]).join();
//   }
//
//   /// Returns the sha256 hash of [input] in hex notation.
//   static String sha256ofString(String input) {
//     final bytes = utf8.encode(input);
//     final digest = sha256.convert(bytes);
//     return digest.toString();
//   }
//
//   static Future<User?> signInWithApple() async {
//     // To prevent replay attacks with the credential returned from Apple, we
//     // include a nonce in the credential request. When signing in in with
//     // Firebase, the nonce in the id token returned by Apple, is expected to
//     // match the sha256 hash of `rawNonce`.
//     final rawNonce = generateNonce();
//     final nonce = sha256ofString(rawNonce);
//
//     try {
//       // Request credential for the currently signed in Apple account.
//       final appleCredential = await SignInWithApple.getAppleIDCredential(
//         scopes: [
//           AppleIDAuthorizationScopes.email,
//           AppleIDAuthorizationScopes.fullName,
//         ],
//         nonce: nonce,
//       );
//
//       print(appleCredential.authorizationCode);
//
//       // Create an `OAuthCredential` from the credential returned by Apple.
//       final oauthCredential = OAuthProvider("apple.com").credential(
//         idToken: appleCredential.identityToken,
//         rawNonce: rawNonce,
//       );
//
//       // Sign in the user with Firebase. If the nonce we generated earlier does
//       // not match the nonce in `appleCredential.identityToken`, sign in will fail.
//       final authResult = await _firebaseAuth.signInWithCredential(oauthCredential);
//
//       final displayName = '${appleCredential.givenName} ${appleCredential.familyName}';
//       final userEmail = '${appleCredential.email}';
//
//       final firebaseUser = authResult.user;
//       print(displayName);
//       await firebaseUser?.updateDisplayName(displayName);
//       await firebaseUser?.updateEmail(userEmail);
//
//       return firebaseUser;
//     } catch (exception) {
//       print(exception);
//     }
//     return null;
//   }
// }
