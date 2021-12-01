import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              Text("OTP Verification", style: TextStyle(fontSize: 28, color: Colors.black),),
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              Text("We sent your code to +234 70 3864 ****"),
              buildTimer(),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1,),
              GestureDetector(
                onTap: (){},
                  child: Text(
                    "Resend OTP code",
                    style: TextStyle(decoration: TextDecoration.underline),)),
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This code will expire in "),
            TweenAnimationBuilder(
              tween: Tween(begin: 30.0, end: 0),
              duration: const Duration(seconds: 30),
              builder: (context, value, child) => Text(
                "00:${0}",
                style: TextStyle(color: kPrimaryColor),),
              onEnd: (){

              },
            ),
          ],
        );
  }
}

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    super.dispose();
  }

  void nextField({required String value, required FocusNode focusNode}){
    if(value.length == 1){
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value, focusNode: pin2FocusNode);
                  },
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value, focusNode: pin3FocusNode);
                  },
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    nextField(value: value, focusNode: pin4FocusNode);
                  },
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value){
                    pin4FocusNode.unfocus();
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15,),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              color: kPrimaryColor,
              onPressed: (){},
              child: Text("Continue",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
