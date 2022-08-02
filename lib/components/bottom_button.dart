import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  VoidCallback onTap;
  String title;

  BottomButton({required this.onTap, required this.title});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20.0),
        child: Center(
          child: Text(
            title,
            style: kLargeTextButtonStyle,
          ),
        ),
        color: kButtonContainerColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kButtonContainerHight,
      ),
    );
  }
}
