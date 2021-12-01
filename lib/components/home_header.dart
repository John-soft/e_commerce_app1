import 'package:e_commerce_app/components/search_field.dart';
import 'package:e_commerce_app/screens/your_cart/your_cart_screen.dart';
import 'package:flutter/material.dart';

import '../size_config.dart';
import 'icon_btn_with_counter.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          SearchField(),
          SizedBox(width: getProportionateScreenWidth(5),),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            numOfItems: 0,
            press: (){
              Navigator.pushNamed(context, YourCartScreen.routeName);
            },),
          SizedBox(width: getProportionateScreenWidth(10),),
          IconBtnWithCounter(
            svgSrc: "assets/icons/Bell.svg",
            numOfItems: 3,
            press: (){

            },
          ),

        ],
      ),
    );
  }
}
