import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/profile/profile_screen.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckOutCard extends StatelessWidget {
  const CheckOutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(offset: Offset(0, -15),
            blurRadius: 20,
            color: const Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenHeight(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
                Text("Add voucher code"),
                const SizedBox(width: 10,),
                Icon(Icons.arrow_forward_ios, size: 12, color: kTextColor,),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(text: "Total \n",
                    children: [
                      TextSpan(text: "\$3337.15", style: TextStyle(fontSize: 16, color: Colors.black)),
                    ],
                  ),
                ),
                SizedBox(width: getProportionateScreenWidth(88),),
                SizedBox(
                  width: 150,
                  height: 56,
                  child: FlatButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: kPrimaryColor,
                    onPressed: (){
                      Navigator.pushNamed(context, ProfileScreen.routeName);
                    },
                    child: Text("Check out",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
