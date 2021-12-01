import 'dart:ui';

import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/social_card.dart';
import 'package:e_commerce_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Register Account",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black),
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Text("Complete your details or continue \n with social media", textAlign: TextAlign.center,),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  late String email, password, confirmPassword;
  List<String> errors = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20),),
            TextFormField(
              onSaved: (newValue) => email = newValue!,
              onChanged: (value) {
                if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                  setState(() {
                    errors.remove(kEmailNullError);
                  });
                } else if (emailValidatorRegExp.hasMatch(value) &&
                    errors.contains(kInvalidEmailError)) {
                  setState(() {
                    errors.remove(kInvalidEmailError);
                  });
                }
                return null;
              },
              validator: (value) {
                if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                  setState(() {
                    errors.add(kEmailNullError);
                  });
                } else if (!emailValidatorRegExp.hasMatch(value) &&
                    !errors.contains(kEmailNullError)) {
                  errors.add(kInvalidEmailError);
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                hintText: "Enter your email",
                labelText: "Email",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Mail.svg",
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) => password = newValue!,
              validator: (value){
                if(value!.isEmpty && !errors.contains(kPassNullError)){
                  setState(() {
                    errors.add(kPassNullError);
                  });
                }else if(value.length < 8 && !errors.contains(kShortPassError)){
                  errors.add(kShortPassError);
                }
                return null;
              },
              onChanged: (value){
                if(value.isNotEmpty && errors.contains(kPassNullError)){
                  setState(() {
                    errors.remove(kPassNullError);
                  });
                }else if(value.length >= 8 && errors.contains(kShortPassError)){
                  setState(() {
                    errors.remove(kShortPassError);
                  });
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Enter your password",
                labelText: "Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Lock.svg",),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
            TextFormField(
              obscureText: true,
              onSaved: (newValue) => confirmPassword = newValue!,
              validator: (value){
                if(value!.isEmpty){
                  return "";
                }else if(password != confirmPassword){
                  errors.add(kShortPassError);
                }
                return null;
              },
              onChanged: (value){
                if(password == confirmPassword){
                  setState(() {
                    errors.remove(kMatchPassError);
                  });
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Re - enter your password",
                labelText: "Confirm Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSuffixIcon(
                  svgIcon: "assets/icons/Lock.svg",),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(40),),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: kPrimaryColor,
                onPressed: (){
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                },
                child: Text("Continue",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(30),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialCard(
                    icon: "assets/icons/google-icon.svg",
                    press: (){},
                ),
                SocialCard(
                  icon: "assets/icons/facebook-2.svg",
                  press: (){},
                ),
                SocialCard(
                  icon: "assets/icons/twitter.svg",
                  press: (){},
                ),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(10),),
            Text(
              "By continuing you confirm that you agree \n with our Terms and Conditions",
              textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}
