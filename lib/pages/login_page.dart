import 'package:flutter/material.dart';
import 'package:provider_tutorial/auth/auth_service.dart';
import 'package:provider_tutorial/components/my_buttom.dart';
import 'package:provider_tutorial/components/my_textfield.dart';
// import 'package:provider_tutorial/pages/home_page.dart';
// import 'package:provider_tutorial/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  // tap to go to register page
  final void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void login() async {
    final authService = AuthService();
    try {
      await authService.signInWithEmailAndPassword(
        _emailController.text,
        _pwController.text,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Error: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Icon(Icons.message),
            // welcome back 
            Text(
              'Welcome back',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            SizedBox(height: 10),
            MyTextfield(
              hintText: 'Email',
              isPassword: false,
              controller: _emailController,
            ),
            SizedBox(height: 10),
            MyTextfield(
              hintText: 'Password',
              isPassword: true,
              controller: _pwController,
            ),
            SizedBox(height: 10),
            CustomButton(
              text: 'Login',
              onPressed: () {
                login();
              },
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member?',
                  style: TextStyle(color: Theme.of(context).colorScheme.primary),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text("Register Now "),
                ),
              ],
            )
            // register button
          ],
        ),
      ),
    );
  }
}
