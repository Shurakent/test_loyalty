import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Авторизация'),),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email')),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Пароль'),
                  obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  try {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text;
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (context.mounted) {
                      Navigator.pushReplacementNamed(context, '/home');
                    }
                  } catch (e) {
                    if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Ошибка входа: $e')),
                      );
                    }
                  }
                },
                child: Text('Вход'),
              )
            ],
          ),
        ),
      ),
    );
  }
}