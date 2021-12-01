import 'package:e_commerce_app/screens/home/components/special_offer_card.dart';
import 'package:e_commerce_app/screens/home/components/special_text.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: const SpecialText(
            text1: "Special for you",
            text2: "See More",
          ),
        ),
        SizedBox(height: getProportionateScreenHeight(20),),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferCard(
                image: 'assets/images/Image Banner 2.png',
                category: 'Smartphone',
                numOfBrands: 18,
                press: (){},
              ),
              SpecialOfferCard(
                image: 'assets/images/Image Banner 3.png',
                category: 'Fashion',
                numOfBrands: 24,
                press: (){},
              ),
              SizedBox(width: getProportionateScreenWidth(20),),
            ],
          ),
        ),
      ],
    );
  }
}
