import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with email and password
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      print("Login Error: ${e.message}");
      return null;
    } catch (e) {
      print("Unexpected Error: ${e.toString()}");
      return null;
    }
  }

  // Register with email and password
  Future<UserCredential?> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result;
    } on FirebaseAuthException catch (e) {
      print("Registration Error: ${e.message}");
      return null;
    } catch (e) {
      print("Unexpected Error: ${e.toString()}");
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print("Sign-out Error: ${e.message}");
    } catch (e) {
      print("Unexpected Error: ${e.toString()}");
    }
  }

  // Get current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
