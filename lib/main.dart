import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/pages/onboarding_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}
  PageController controller = PageController();
  // int counter=0;

class HomePage extends StatelessWidget {
   HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller:controller ,
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      onPageChanged: (value) {
        // controller.jumpToPage(2);
        // counter++;
      },
      children: [
        ObBoardingScreenWidget(subtitle:"This is a subtitle very helpful\n for the first" ,title: "This is the First",),
        ObBoardingScreenWidget(subtitle:"This is a subtitle very helpful\n for the second" ,title: "This is the second",),
        ObBoardingScreenWidget(subtitle:"This is a subtitle very helpful\n for the third" ,title: "This is the third",)
      ],
    );
  }
}

