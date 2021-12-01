import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/components/no_account_text.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/sign_in/components/sign_form.dart';
import '../../../components/social_card.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text("Welcome Back",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text("Sign in with your email and password \n or continue with social media",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.08,),
                  const SignForm(),
                  SizedBox(height: SizeConfig.screenHeight * 0.05,),
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
                  const SizedBox(height: 20,),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        )
    );
  }
}

