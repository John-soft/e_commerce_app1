import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/profile/components/profile_menu.dart';
import 'package:e_commerce_app/screens/profile/components/profile_pic.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20,),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "My Account",
            press: (){},
          ),
          ProfileMenu(
            icon: "assets/icons/Bell.svg",
            text: "Notification",
            press: (){},
          ),
          ProfileMenu(
            icon: "assets/icons/Question mark.svg",
            text: "Settings",
            press: (){},
          ),
          ProfileMenu(
            icon: "assets/icons/User Icon.svg",
            text: "Help Center",
            press: (){},
          ),
          ProfileMenu(
            icon: "assets/icons/Log out.svg",
            text: "Log Out",
            press: (){},
          ),
        ],
      ),
    );
  }
}
