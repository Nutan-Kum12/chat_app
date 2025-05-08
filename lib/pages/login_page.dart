import 'package:flutter/material.dart';
import 'package:provider_tutorial/components/my_buttom.dart';
import 'package:provider_tutorial/components/my_textfield.dart';
import 'package:provider_tutorial/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _pwController=TextEditingController();

  LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}
void login(){

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
          SizedBox(height: 10),
          MyTextfield(
          hintText: 'Email',
          isPassword: false,
          controller: widget._emailController,
          ),
          SizedBox(height: 10),
          MyTextfield(
          hintText: 'Password',
          isPassword: true,
          controller: widget._pwController,
          ),
          SizedBox(height: 10),
          MyTextfield(
          hintText: ' Confirm Password',
          isPassword: true,
          controller: widget._pwController,
          ),
          // email text field
          // password text field
          SizedBox(height: 10),
          CustomButton(
            text: 'Login',
            onPressed: () {
             login;
            },
          ),
          // login button
          SizedBox(height: 10),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not a member?'),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Register Now',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
         )
          // register button
        ],),
      ),

    );
  }
}