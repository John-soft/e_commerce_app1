import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/components/rounded_icon_button.dart';
import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'color_dot.dart';

class ColorDots extends StatelessWidget {
  final Product product;
  const ColorDots({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selectedColor = 3;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(product.colors.length, (index) =>
              ColorDot(color: product.colors[index], isSelected: selectedColor == index,),
          ),
          Spacer(),
          RoundedIconButton(iconData: Icons.remove,
              press: (){
              },
          ),
          SizedBox(width: 10,),
          RoundedIconButton(iconData: Icons.add,
            press: (){
            },
          ),
        ],
      ),
    );
  }
}
