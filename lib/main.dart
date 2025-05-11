import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider_tutorial/auth/auth_gate.dart';
import 'package:provider_tutorial/firebase_options.dart';
import 'package:provider_tutorial/themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();  // Initialize Firebase
    runApp(MyApp());
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightMode,
      home: AuthGate()
    );
  }
}
