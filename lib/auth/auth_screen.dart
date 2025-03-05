import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hookah/app/home/home_screen.dart';
import 'package:hookah/app/navigation.dart';

class AuthScreen extends StatelessWidget {
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
                  decoration: InputDecoration(labelText: 'Password'),
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
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigation()));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Ошибка входа: $e')),
                    );
                  }
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}