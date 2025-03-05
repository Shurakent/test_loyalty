import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../app_config.dart';

class FirestoreUtil with ChangeNotifier {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> loadUserName(String userId) async {
    try {
      final doc = await _firestore
          .collection(AppConfig.usersCollection)
          .doc(userId)
          .get();
      if (doc.exists) {
        return doc[AppConfig.userNameField] as String?;
      }
    } catch (e) {
      debugPrint("Error loading user name: $e");
    }
    return null;
  }

}