import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../utils/singletons.dart';

@singleton
class FirebaseAuthService {
  late final _auth = FirebaseAuth.instance;

  bool get isSignedIn => _auth.currentUser != null;

  Future<void> signOut() {
    userDataData.setToken('');
    return _auth.signOut();
  }

  Future<void> init() async {
    if (isSignedIn == true) {
      final _token = await _auth.currentUser?.getIdToken(true);
      if (_token != null) {
        await userDataData.setToken(_token);
      }
    }
  }

  Future<String?> refreshToken({bool forceRefresh = false}) async {
    return await _auth.currentUser?.getIdToken(forceRefresh);
  }

  DateTime? getAuthTime() {
    return _auth.currentUser?.metadata.lastSignInTime;
  }

  // ignore: unused_element
  bool _isTestAccount(String phone) {
    final prodTestAccounts = ['976105222'];
    for (final element in prodTestAccounts) {
      if (phone.contains(element) == true) {
        return true;
      }
    }
    return false;
  }

  Future loginWithEmail(String email, String password) async {
    // Trigger the sign-in flow
    try {
      final response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final token = await response.user?.getIdToken(false);
      if (token != null) {
        await userDataData.setToken(token);
      }
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          return 'Invalid Email';
        case 'user-disabled':
          return 'User Disabled';
        case 'user-not-found':
          return 'User not found';
        case 'wrong-password':
          return 'Wrong password';
        default:
          return e.message;
      }
    }
  }
}
