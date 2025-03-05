import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUtil {

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  String collection;
  String field;
  double _balance = -1;

  FirestoreUtil({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required this.collection,
    required this.field})
  : _firestore = firestore,
    _auth = auth;


  Future<double?> getByUserField() async {
    final user = _auth.currentUser;
    if (user != null) {
      final doc = await _firestore.collection(collection).doc(user.uid).get();
      if (doc.exists) {
        _balance = doc[field];
        return _balance;
      }
      else {
        return null;
      }
    }
    else {
      return null;
    }
  }

}