import 'package:e_commerce_app/enums.dart';
import 'package:e_commerce_app/screens/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/custom_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile", style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
      body: Body(),
      bottomNavigationBar: CustomNavBar(selectedMenu: MenuState.profile,),
    );
  }
}
