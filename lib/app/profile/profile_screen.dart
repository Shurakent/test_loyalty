import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hookah/auth/auth_provider/auth_provider.dart';

class ProfileScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user == null){
      return Center(child: Text('Пользователь не авторизован.'));
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
                },
                child: Text('Выйти'))
          ],
        ),),
    );
  }
  
}