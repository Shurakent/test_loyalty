import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hookah/app/home_screen.dart';
import 'package:hookah/auth/auth_provider/auth_provider.dart';
import 'package:hookah/auth/auth_screen.dart';
import 'package:provider/provider.dart';

//TODO: поставить переключение экранов на Navigator с route (?)

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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AuthWrapper(),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user != null) {
      return HomeScreen();
    }

    return AuthScreen();
  }
}




