import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trial1/auth/login.dart';
import 'package:trial1/auth/register.dart';
import 'package:trial1/firebase_options.dart';
import 'package:trial1/splast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Trial());
}

class Trial extends StatelessWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Hide debug banner
      initialRoute: '/', //  Set SplashScreen as initial screen
      routes: {
        '/': (context) => SplashScreen(), // First screen
        '/login': (context) => LoginPage(), //  Navigates after splash
        '/register': (context) => RegisterPage(), //  Register page
      },
    );
  }
}
