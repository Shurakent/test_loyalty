import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hookah/auth/auth_provider/auth_provider.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;
    final name = authProvider.name;
    if(user == null) {
      return Center(child: Text("Пользователя нет."));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Профиль"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Добро пожаловать, $name'),
            Text('Ваш email: ${user.email}'),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  await authProvider.signOut(context);
                },
                child: Text('Выйти'))
          ],
        ),),
    );
  }
}