import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/components/product_description.dart';
import 'package:e_commerce_app/screens/details/components/product_images.dart';
import 'package:e_commerce_app/screens/details/components/top_rounded_corner.dart';
import 'package:e_commerce_app/screens/your_cart/your_cart_screen.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_dot.dart';
import 'color_dots.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product,),
          TopRoundedCorner(
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                    pressSeeMore: (){},
                  ),
                  TopRoundedCorner(
                    color: Color(0xfff6f7f9),
                    child: Column(
                      children: [
                        ColorDots(product: product),
                        TopRoundedCorner(
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: SizeConfig.screenWidth * 0.15,
                                left: SizeConfig.screenWidth * 0.15,
                                bottom: getProportionateScreenWidth(40),
                                top: getProportionateScreenWidth(15),
                              ),
                              child: SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  color: kPrimaryColor,
                                  onPressed: (){
                                    Navigator.pushNamed(context, YourCartScreen.routeName);
                                  },
                                  child: Text("Add To Cart",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
