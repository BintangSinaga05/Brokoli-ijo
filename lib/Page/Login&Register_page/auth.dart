import 'package:basic/Page/Login&Register_page/exception/exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      return user?.uid;
    } on FirebaseAuthException catch (e) {
      final ex = Failure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = Failure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      UserCredential authResult = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = authResult.user;
      return user?.uid;
    } catch (e) {
      final snackbar = SnackBar(
        content: Text("$e"),
        action: SnackBarAction(label: 'OK', onPressed: () {}),
      );
      ScaffoldMessenger(child: snackbar);
      return null;
    }
  }

  Future<User?> getUser() async {
    User? user = _firebaseAuth.currentUser;
    return user;
  }
}
