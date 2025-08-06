

import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/widget/on_boarding_button.dart';


// ? Reusbale Class
class ObBoardingScreenWidget extends StatelessWidget {
   ObBoardingScreenWidget({super.key,required this.subtitle,required this.title});

String title;
String subtitle;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(padding: EdgeInsetsGeometry.all(20)),
          Text("LifeStyle", style: TextStyle(fontSize: 32, color: Colors.grey)),
          FlutterLogo(size: 230),
          Text(
            title,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.w200,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.attach_money, color: Colors.pink.shade300),

              Icon(Icons.attach_money, color: Colors.pink),
              Icon(Icons.attach_money, color: Colors.pink.shade300),
            ],
          ),
          InkWell(
            
            onTap: () {
              if (controller.page! <=1) {
                
              controller.nextPage(duration: Duration(seconds: 2), curve: Curves.easeInCirc);
              } else {
              controller.animateToPage(0, duration: Duration(seconds: 2), curve: Curves.easeInOutSine);
                
              }
              // if (counter==0 || counter==1) {
              //   counter++;
              // }else{

              // }
            },
            child: OnBoardingButton(child: "Let go",),
          ),Padding(padding: EdgeInsetsGeometry.all(15))
        ],
      ),
    );
  }
}
