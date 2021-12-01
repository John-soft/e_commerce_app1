import 'package:e_commerce_app/screens/otp/components/body.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp_screen";
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("OTP Verification", style: TextStyle(fontSize: 20, color: Colors.grey),),
      ),
      body: Body(),
    );
  }
}
