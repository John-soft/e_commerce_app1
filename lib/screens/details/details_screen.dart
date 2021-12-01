import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/screens/details/components/body.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';
import 'components/rounded_icon_button.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as ProductDetailsArguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: 20),
          child: RoundedIconButton(
            iconData: Icons.arrow_back_ios,
            press: (){
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Body(product: arguments.product,),
    );
  }
}

class ProductDetailsArguments{
  final Product product;
  ProductDetailsArguments({
    required this.product,
});
}