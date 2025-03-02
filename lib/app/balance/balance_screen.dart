import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hookah/app_config.dart';

import '../utils/firestore_util.dart';

class BalanceScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {


//     final user = _auth.currentUser;
//     if (user == null) {
//       return Center(child: Text('Пользователь не аутентифицирован'));
//     }

    return Scaffold(
      appBar: AppBar(title: Text('Управление балансом')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(AppConfig.usersCollection)
            .doc()
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Документ не найден'));
          } else {
            final balance = snapshot.data![AppConfig.userBalanceField] ?? 0;
            return Center(
              child: Text('Текущий баланс: $balance'),
            );
          }
        },
      ),
    );
  }
}