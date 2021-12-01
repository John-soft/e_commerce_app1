import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductDescription extends StatelessWidget {
  final Product product;
  final GestureTapCallback pressSeeMore;
  const ProductDescription({Key? key, required this.product, required this.pressSeeMore}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Text(product.title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5,),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            width: getProportionateScreenWidth(64),
            decoration: BoxDecoration(
              color: product.isFavorite
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
            ),
            child: SvgPicture.asset("assets/icons/Heart Icon_2.svg",  color: Color(0xFFFF4848),),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: getProportionateScreenWidth(20),
            right: getProportionateScreenWidth(64),
          ),
          child: Text(product.description,
            maxLines: 3,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),
              vertical: 10
          ),
          child: GestureDetector(
            onTap: pressSeeMore,
            child: Row(
              children: [
                Text("See More Detail",
                  style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 5,),
                Icon(Icons.arrow_forward_ios, size: 12,color: kPrimaryColor,)
              ],
            ),
          ),
        )
      ],
    );
  }
}
