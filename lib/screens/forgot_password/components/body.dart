import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/no_account_text.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

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
              const Text("Forgot Password",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.black),
              ),
              const Text("Please enter your email and we will send \n you a link to your account",
                textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.12,),
              const ForgotPassForm(),
    ],
    ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
        TextFormField(
          onSaved: (newValue) => email = newValue!,
          onChanged: (value){
            if(value.isNotEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            }else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
              setState(() {
                errors.remove(kInvalidEmailError);
              });
            }
            return null;
          },
          validator: (value){
            if(value!.isEmpty && errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
              });
            }else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kEmailNullError)){
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
        SizedBox(
          height: SizeConfig.screenHeight * 0.15,
        ),
        SizedBox(
          width: double.infinity,
          height: 56,
          child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: kPrimaryColor,
            onPressed: (){
              if(_formKey.currentState!.validate()){

              }
            },
            child: Text("Continue",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white
              ),
            ),
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(40),),
        NoAccountText(),
      ],
      ),
    );
  }
}

