import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:e_commerce_app/screens/login_success/login_success_screen.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';


class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  late String email;
  late String password;
  bool remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(20),),
            buildPassFormField(),
            SizedBox(height: getProportionateScreenHeight(20),),
            SizedBox(height: getProportionateScreenHeight(20),),
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value){
                    setState(() {
                      remember = value!;
                    });
                  },
                ),
                const Text("Remember me", style: TextStyle(fontSize: 15),),
                Spacer(flex: 1,),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                  child: Text("Forgot Password", style: TextStyle(
                    decoration: TextDecoration.underline,fontSize: 15
                  ),
                  ),
                ),
              ],
            ),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20),),
            SizedBox(
              width: double.infinity,
              height: getProportionateScreenHeight(56),
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: kPrimaryColor,
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    _formKey.currentState!.save();
                    Navigator.pushNamed(context, LoginSuccessScreen.routeName);
                  }
                },
                child: const Text("Continue",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildPassFormField() {
    return TextFormField(
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
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
        if(value!.isEmpty && !errors.contains(kEmailNullError)){
          setState(() {
            errors.add(kEmailNullError);
          });
        }else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kEmailNullError)){
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
    );
  }

}



