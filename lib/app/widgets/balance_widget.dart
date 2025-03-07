import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:hookah/utils/auth_provider.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
     if (user == null) {
       return Center(child: Text('Пользователь не аутентифицирован'));
     }
    return Scaffold(
      appBar: AppBar(title: Text('Управление балансом')),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('Документ не найден'));
          } else {
            final balance = snapshot.data!['balance'] ?? 0;
            return Center(
              child: Text('Текущий баланс: $balance'),
            );
          }
        },
      ),
    );
  }
}