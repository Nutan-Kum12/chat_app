import 'package:flutter/material.dart';
import 'package:provider_tutorial/components/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          //logo
          Icon(Icons.message),
             //welcome back 
          Text(
            'Welcome back',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          MyTextfield(
          hintText: 'Email',
          
          ),
          SizedBox(height: 10),
          MyTextfield(
          hintText: 'Password',
          isPassword: true,
          ),
          SizedBox(height: 10),
          MyTextfield(
          hintText: ' Confirm Password',
          isPassword: true,
          ),
          // email text field
          // password text field
          // login button
          // register button
        ],),
      ),

    );
  }
}