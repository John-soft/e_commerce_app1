import 'package:e_commerce_app/screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce_app/screens/splash/components/splash_content.dart';
import 'package:e_commerce_app/size_config.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {"image": "assets/images/splash_1.png",
      "text": "Welcome to our store, Let's shop"
    },
    {"image": "assets/images/splash_2.png",
      "text": "We help people in Nigeria \n connect to store around them"
    },
    {"image": "assets/images/splash_3.png",
      "text": "We show the easy way to shop \n just stay at home with us"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children:  [
            Expanded(
              flex: 3,
                child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      currentPage = value;
                    });
                  },
                  itemCount: splashData.length,
                    itemBuilder: (context, index) =>
                        SplashContent(
                            text: splashData[index]["text"]!,
                            image: splashData[index]['image']!,
                        ),
                ),
            ),
            Expanded(
              flex: 2,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length,
                                (index) =>
                                    buildDot(index: index),
                        ),
                      ),
                      SizedBox(height: 130,),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          color: kPrimaryColor,
                            onPressed: (){
                            Navigator.pushNamed(context, SignInScreen.routeName);
                            },
                            child: const Text("Continue",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white
                            ),
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor: Colors.grey,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
