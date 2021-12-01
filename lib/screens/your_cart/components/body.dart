import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart_item_card.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context,index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: CartItemCard(
              cart: demoCarts[index],
            ),
          );
        },

      ),
    );
  }
}
