import 'package:e_commerce_app/models/cart.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  final Cart cart;
  const CartItemCard({Key? key, required this.cart}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0],
              ),
            ),
          ),
        ),
        SizedBox(width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cart.product.title, style: const TextStyle(
              fontSize: 16, color: Colors.black,
            ),
              maxLines: 3,
            ),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
                style: TextStyle(
                  color: Colors.deepOrangeAccent,
                ),
                children: [
                  TextSpan(
                    text: " x${cart.numOfItems}",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
