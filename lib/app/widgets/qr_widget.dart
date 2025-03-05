
// Пример экранов
import 'package:flutter/material.dart';
import 'package:hookah/utils/auth_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

class QrWidget extends StatelessWidget {
  const QrWidget({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    return Scaffold(
      appBar: AppBar(title: Text('Система лояльности')),
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



