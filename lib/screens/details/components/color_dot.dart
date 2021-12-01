import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ColorDot extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const ColorDot({Key? key, required this.color, this.isSelected = false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
        //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(color: isSelected ? kPrimaryColor : Colors.transparent)
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle
        ),
      ),
    );
  }
}
