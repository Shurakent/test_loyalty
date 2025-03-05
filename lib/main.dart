import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hookah/app/home_screen.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        final authProvider = Provider.of<AuthProvider>(context, listen: false);
        final user = authProvider.user;

        switch(settings.name){
          case '/':
            if (user != null){
              return MaterialPageRoute(builder: (context) => HomeScreen());
            }
            return MaterialPageRoute(builder: (context) => AuthScreen());
          case '/auth':
            return PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => AuthScreen(),
            transitionDuration: Duration.zero
            );
          case '/home':
            return MaterialPageRoute(builder: (context) => HomeScreen());
          default:
            return MaterialPageRoute(builder: (context) => AuthScreen());
        }
      },
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




