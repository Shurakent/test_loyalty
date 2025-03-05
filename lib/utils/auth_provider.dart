import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hookah/app_config.dart';

//TODO: переместить работу с Firestore в отдельный класс(?), использовать кэширование

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? _user;
  String? _name;

  User? get user => _user;
  String? get name => _name;

  AuthProvider() {
    _auth.authStateChanges().listen((User? user) async {
      _user = user;
      if (user != null) {
        await _loadUserName(user.uid);
      } else {
        _name = null;
      }
      notifyListeners();
    });
  }

  Future<void> _loadUserName(String userId) async {
    final doc = await _firestore
        .collection(AppConfig.usersCollection)
        .doc(userId)
        .get();
    if (doc.exists) {
      _name = doc[AppConfig.userNameField] as String?;
      notifyListeners();
    }
  }

  Future<void> signOut(context) async {
    Navigator.pushReplacementNamed(context, '/auth');
    await _auth.signOut();
  }
}