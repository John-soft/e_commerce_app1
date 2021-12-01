import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({Key? key,
    required this.iconData,
    required this.press}) : super(key: key);

  final IconData iconData;
  final GestureTapCallback press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: 40,
        height: 40,
        child: FlatButton(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Colors.white,
          onPressed: (){},
          child: Icon(iconData),
        ),
      ),
    );
  }
}
