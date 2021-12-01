import 'package:e_commerce_app/screens/sign_in/components/body.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = '/sign_in';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sign In", style: TextStyle(color: Colors.grey, fontSize: 25),
        ),
      ),
      body:const Body(),
    );
  }
}
