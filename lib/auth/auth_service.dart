import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign-in method
  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Attempt to sign in
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: password
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // FirebaseAuthException provides specific error handling
      if (e.code == 'user-not-found') {
        print("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        print("Wrong password provided.");
      } else if (e.code == 'invalid-email') {
        print("The email address is badly formatted.");
      } else {
        // Handle other error codes
        print("Error during sign-in: ${e.message} - ${e.code}");
      }
      throw Exception("FirebaseAuthError: ${e.message} - ${e.code}");
    } catch (e) {
      // Handle other types of errors (network issues, etc.)
      print("General error: $e");
      throw Exception("GeneralError: $e");
    }
  }

  // Sign-out method
  Future<void> signOut() async {
    await _auth.signOut();
    print("User signed out successfully.");
  }

  // Additional methods (register, etc.) can be added here
}
