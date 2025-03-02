import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hookah/app/utils/firestore_util.dart';
class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("lol"),
    );
  }

}
// class ProfileScreen extends StatefulWidget{
//   @override
//   _ProfileScreenState createState() =>  _ProfileScreenState();
// }
//
// class _ProfileScreenState extends State<ProfileScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final TextEditingController _textEditingController = TextEditingController();
//   String _name = '';
//   bool _isEditing = false;
//   FirestoreUtil _firestoreUtil = FirestoreUtil(
//       firestore: _firestore,
//       auth: ,
//       collection: collection,
//       field: field)
//
//   @override
//   void initState() {
//     super.initState();
//     final user
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
//
// }