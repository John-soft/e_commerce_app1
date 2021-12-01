import 'package:e_commerce_app/components/discount_banner.dart';
import 'package:e_commerce_app/components/home_header.dart';
import 'package:e_commerce_app/components/search_field.dart';
import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/components/icon_btn_with_counter.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/details_screen.dart';
import 'package:e_commerce_app/screens/home/components/product_card.dart';
import 'package:e_commerce_app/screens/home/components/special_offer_card.dart';
import 'package:e_commerce_app/screens/home/components/special_offers.dart';
import 'package:e_commerce_app/screens/home/components/special_text.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'categories.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenWidth(20),),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(30),),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenWidth(20),),
              Categories(),
              SizedBox(height: getProportionateScreenWidth(20),),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(20),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: SpecialText(text1: "Popular Product", text2: "See More"),
              ),
              SizedBox(height: getProportionateScreenWidth(20),),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(demoProducts.length, (index) => ProductCard(
                        product: demoProducts[index],
                      press: (){
                          Navigator.pushNamed(
                              context,
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(product:
                              demoProducts[index],
                              ));
                      },
                    ),
                    ),
                  ],
                ),
              ),
              Container(

              )
            ],
          ),
        ),
    );
  }
}

