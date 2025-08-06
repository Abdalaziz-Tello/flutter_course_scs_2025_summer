
import 'package:flutter/material.dart';


// ? Reusble class or Wiget
class OnBoardingButton extends StatelessWidget {
   OnBoardingButton({
    super.key,
    required this.child
  });

  String child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 208,
      height: 58,
      alignment: Alignment.center,
      child: Text(child, style: TextStyle(color: Colors.white)),
      decoration: BoxDecoration(
        color: Colors.pink.shade300,
    
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
