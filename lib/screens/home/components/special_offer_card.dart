import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;
  const SpecialOfferCard({Key? key, required this.category, required this.image, required this.numOfBrands, required this.press}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(image, fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(TextSpan(
                    style: TextStyle(color: Colors.white),
                    children: [
                      TextSpan(text: "$category \n",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(
                          text: "$numOfBrands Brands"
                      ),
                    ],
                  ),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
