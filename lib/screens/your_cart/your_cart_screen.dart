import 'package:e_commerce_app/models/cart.dart';
import 'package:e_commerce_app/screens/your_cart//components/body.dart';
import 'package:flutter/material.dart';

import 'components/check_out_card.dart';

class YourCartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const YourCartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text("Your Cart",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.black),
            ),
            Text("${demoCarts.length} items", style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckOutCard(),
    );
  }

}
