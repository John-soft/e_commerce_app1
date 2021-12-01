import 'package:e_commerce_app/components/custom_suffix_icon.dart';
import 'package:e_commerce_app/components/form_error.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'complete_profile_form.dart';

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
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
              Text("Complete Profile", style: TextStyle(fontSize: getProportionateScreenWidth(28), color: Colors.black),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.02,),
              Text("Complete your details or continue \n with social media", textAlign: TextAlign.center,),
              SizedBox(height: SizeConfig.screenHeight * 0.05,),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30),),
              Text("By continuing you confirm tha you agree \n with our Terms and Conditions", textAlign: TextAlign.center,),
            ],
          ),
        ),
      ),
    );
  }
}
