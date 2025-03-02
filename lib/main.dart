import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hookah/auth/auth_provider/auth_provider.dart';
import 'package:hookah/auth/auth_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => AuthProvider()),
          ],
          child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loyalty App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthScreen(),
    );
  }
}




