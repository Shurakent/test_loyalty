
// Пример экранов
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_flutter/qr_flutter.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(title: Text('Loyalty System')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(data: user?.uid ?? 'Unknown' '200', size: 200),
            SizedBox(height: 20),
            Text('Ваш QR-код для начисления бонусов')
          ],
        ),
      ),
    );
  }
}



