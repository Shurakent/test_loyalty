import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firestore_util.dart';

//TODO: использовать кэширование

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;
  String? _name;

  User? get user => _user;
  String? get name => _name;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) async {
      _user = user;
      if (user != null) {
        _name = await FirestoreUtil().loadUserName(user.uid);
      } else {
        _name = null;
      }
      notifyListeners();
    });
  }

  Future<void> signOut(context) async {
    Navigator.pushReplacementNamed(context, '/auth');
    await _auth.signOut();
  }
}