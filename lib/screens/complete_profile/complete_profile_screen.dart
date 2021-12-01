import 'package:e_commerce_app/screens/complete_profile/components/body.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  static String routeName = "/complete_profile";
  const CompleteProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         centerTitle: true,
        title: Text("Complete Profile", style: TextStyle(fontSize: 20, color: Colors.grey),),
      ),
      body: Body(),
    );
  }
}
