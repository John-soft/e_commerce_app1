
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ProfileMenu extends StatelessWidget {
  final String text, icon;
  final Function press;
  const ProfileMenu({Key? key, required this.text, required this.icon, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Color(0xfff5f6f9),
        onPressed: press(),
        child: Row(
          children: [
            SvgPicture.asset(icon, width: 22,color: kPrimaryColor,),
            SizedBox(width: 20,),
            Expanded(
              child: Text(text),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
