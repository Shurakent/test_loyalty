import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hookah/auth/auth_provider/auth_provider.dart';

import '../../auth/auth_screen.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if(user == null) {
      return Center(child: Text("Пользователя нет."));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Профиль"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Добро пожаловать, ${user.email}'),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut();
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => AuthScreen()),
                          (Route<dynamic> route) => false);
                },
                child: Text('Выйти'))
          ],
        ),),
    );
  }
}