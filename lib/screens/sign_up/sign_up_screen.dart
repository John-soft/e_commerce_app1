import 'package:e_commerce_app/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign Up", style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
      body: Body(),
    );
  }
}
